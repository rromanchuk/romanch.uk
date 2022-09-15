require 'utils/csv/aircraft_report_tools'
module Wx
  module Tafs
    class Process < Service
      
      attr_reader :batch

      let(:client) { Aws::S3::Client.new(region: 'us-east-1') }
      let(:xml) {Ox.load(resp.body.read, mode: :hash)}
      let(:resp) { client.get_object(bucket: :pireps, key: batch.key) }

      def initialize(batch)
        super()
        @batch = batch
      end

      def call
        transform!
      end

      def transform!
        toal_num_results = xml[:response][7][:data].shift
        toatal_records_processed = 0
        Rails.logger.info "Updating batch file num_records #{num_results}"
        xml[:response][7][:data].in_groups_of(10) do |chunk|
          taf_records = chunk.map do |record|
            taf = record.delete(:TAF)
            {
              raw_text: taf[:raw_text],
              station_id: taf[:station_id],
              issue_time: taf[:issue_time],
              bulletin_time: taf[:bulletin_time],
              valid_time_from: taf[:valid_time_from],
              valid_time_to: taf[:valid_time_to],
              remarks: taf[:remarks],
              location: "POINT(#{taf[:latitude]} #{taf[:longitude]} #{taf[:elevation_m]})",
              forecast: taf[:forecast],
              batch_id: batch.id
            }
          end
          Rails.logger.info "Inserting chunk of #{taf_records.length} records"
          results = Wx::Taf.insert_all(taf_records, unique_by: :index_wx_tafs_uniqueness)
          Rails.logger.info "Inserted #{results.length} new records"
          toatal_records_processed += results.length
        end
        batch.update!(processed_at: Time.current, num_records_processed: toatal_records_processed)
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
#}
