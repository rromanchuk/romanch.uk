# rubocop:disable all
require 'ox'
module Tds
  module Tafs
    class Process < Service
      attr_reader :batch

      let(:client) { Aws::S3::Client.new(region: 'us-east-1') }
      let(:xml) { Ox.load(gzip.read, mode: :hash) }
      let(:resp) { client.get_object(bucket: :pireps, key: batch.key) }
      let(:gzip) { Zlib::GzipReader.new(resp.body)  }

      def initialize(batch_id)
        super()
        @batch = Batch.find batch_id
      end

      def call
        transform!
      end

      def transform!
        toal_num_results = xml[:response][7][:data].shift
        toatal_records_processed = 0
        Rails.logger.info "Updating batch file num_records #{toal_num_results}"
        xml[:response][7][:data].in_groups_of(10) do |chunk|
          taf_records = chunk.map do |record|
            next unless (taf = record&.delete(:TAF))

            {
              raw_text: taf[:raw_text],
              station_id: Tds::Station.create_with(latitude: taf[:latitude], longitude: taf[:longitude], elevation_m: taf[:elevation_m]).find_or_create_by!(code: taf[:station_id])&.id,
              issue_time: taf[:issue_time],
              bulletin_time: taf[:bulletin_time],
              valid_time_from: taf[:valid_time_from],
              valid_time_to: taf[:valid_time_to],
              remarks: taf[:remarks],
              forecast: taf[:forecast],
              batch_id: batch.id
            }
          end.compact
          Rails.logger.info "Inserting chunk of #{taf_records.length} records"
          results = Tds::Taf.insert_all(taf_records, unique_by: :index_tds_tafs_uniqueness)
          Rails.logger.info "Inserted #{results.length} new records"
          toatal_records_processed += results.length
        end
        batch.update!(processed_at: Time.current, num_records_processed: toatal_records_processed)
        nil
      rescue Ox::ParseError => e
        Rails.logger.error e
        Sentry.capture_exception(e)
        batch.update!(failed_at: Time.current)
        nil
      end
    end
  end
end

# irb(main):032:0> ap t[:response][7][:data][1][:TAF]
# {
#            :raw_text => "KBOI 151026Z 1510/1606 12010G20KT P6SM VCTS BKN070CB TEMPO 1510/1513 30010G20KT -SHRA OVC070 FM151300 13007KT P6SM BKN100 FM160100 20006KT P6SM VCTS BKN100CB",
#          :station_id => "KBOI",
#          :issue_time => "2022-09-15T10:26:00Z",
#       :bulletin_time => "2022-09-15T10:26:00Z",
#     :valid_time_from => "2022-09-15T10:00:00Z",
#       :valid_time_to => "2022-09-16T06:00:00Z",
#             :remarks => "AMD",
#            :latitude => "43.57",
#           :longitude => "-116.23",
#         :elevation_m => "860.0",
#            :forecast => [
#         [0] {
#                    :fcst_time_from => "2022-09-15T10:00:00Z",
#                      :fcst_time_to => "2022-09-15T13:00:00Z",
#                  :wind_dir_degrees => "120",
#                     :wind_speed_kt => "10",
#                      :wind_gust_kt => "20",
#             :visibility_statute_mi => "6.21",
#                         :wx_string => "VCTS",
#                     :sky_condition => [
#                 [0] {
#                             :sky_cover => "BKN",
#                     :cloud_base_ft_agl => "7000",
#                            :cloud_type => "CB"
#                 }
#             ]
#         },
#         [1] {
#               :fcst_time_from => "2022-09-15T10:00:00Z",
#                 :fcst_time_to => "2022-09-15T13:00:00Z",
#             :change_indicator => "TEMPO",
#             :wind_dir_degrees => "300",
#                :wind_speed_kt => "10",
#                 :wind_gust_kt => "20",
#                    :wx_string => "-SHRA",
#                :sky_condition => [
#                 [0] {
#                             :sky_cover => "OVC",
#                     :cloud_base_ft_agl => "7000"
#                 }
#             ]
#         },
#         [2] {
#                    :fcst_time_from => "2022-09-15T13:00:00Z",
#                      :fcst_time_to => "2022-09-16T01:00:00Z",
#                  :change_indicator => "FM",
#                  :wind_dir_degrees => "130",
#                     :wind_speed_kt => "7",
#             :visibility_statute_mi => "6.21",
#                     :sky_condition => [
#                 [0] {
#                             :sky_cover => "BKN",
#                     :cloud_base_ft_agl => "10000"
#                 }
#             ]
#         },
#         [3] {
#                    :fcst_time_from => "2022-09-16T01:00:00Z",
#                      :fcst_time_to => "2022-09-16T06:00:00Z",
#                  :change_indicator => "FM",
#                  :wind_dir_degrees => "200",
#                     :wind_speed_kt => "6",
#             :visibility_statute_mi => "6.21",
#                         :wx_string => "VCTS",
#                     :sky_condition => [
#                 [0] {
#                             :sky_cover => "BKN",
#                     :cloud_base_ft_agl => "10000",
#                            :cloud_type => "CB"
#                 }
#             ]
#         }
#     ]
# }
