require 'aws-sdk-s3'
require 'csv'
REDIS_PIREPS = RedisClient.new 
# https://docs.aws.amazon.com/sdk-for-ruby/v3/api/Aws/S3/Client.html#select_object_content-instance_method
module Pireps
  class Process < Service

    attr_reader :raw_pirep
    let(:client) { Aws::S3::Client.new(region: 'us-east-1') }
    
    def initialize(raw_pirep)
      super()
      @raw_pirep = raw_pirep
    end

    def params
      {
        bucket: :pireps, # required
        key: raw_pirep.key, # required
        expression_type: "SQL", # required, accepts SQL,
        expression: "SELECT * FROM S3Object s3objec", # required
        input_serialization: {
          compression_type: "GZIP",
          csv: {
            file_header_info: "IGNORE", # accepts USE, NONE
          }
        },
        output_serialization: {
          csv: {}
        }
      }
    end

    def call
      client.select_object_content(params) do |stream|
        stream.on_error_event do |event|
          Rails.logger.error event.error_message
          # catch unmodeled error event in the stream
          raise event
        end
        row_segments = []
        # Callback for every event that arrives
        stream.on_event do |event|
          Rails.logger.debug event.event_type
          next unless event.event_type == :records
          raw_row_segment = event.payload.string
          row_segments << raw_row_segment
          next unless raw_row_segment.end_with?("\n")
          raw_row = row_segments.join("")
          row_segments = []
          Rails.logger.debug raw_row
          CSV.parse(raw_row) do |row|
            ap row
            ap row.count
            next unless row.count == 45
            ap by_csv_row(row)
          end
          Rails.logger.debug "\n\n\n"
        end
      end
    end

    def by_csv_row(row)
      payload = {
        receipt_time: row[0],
        observation_time: [1], # sort key
        mid_point_assumed: row[2],
        no_time_stamp: row[3],
        flt_lvl_range: row[4],
        above_ground_level_indicated: row[5],
        no_flt_lvl: row[6],
        bad_location: row[7],
        aircraft_ref: row[8],
        latitude: row[9], # Sort key
        longitude: row[10],
        altitude_ft_msl: row[11],
        sky_cover: row[12],
        cloud_base_ft_msl: row[13],
        cloud_top_ft_msl: row[14],
        sky_cover_2: row[15],
        cloud_base_ft_msl_2: row[16],
        cloud_top_ft_msl_2: row[17],
        turbulence_type: row[18],
        turbulence_intensity: row[19],
        turbulence_base_ft_msl: row[20],
        turbulence_top_ft_msl: row[21],
        turbulence_freq: row[22],
        turbulence_type_2: row[23],
        turbulence_intensity_2: row[24],
        turbulence_base_ft_msl_2: row[25],
        turbulence_top_ft_msl_2: row[26],
        turbulence_freq_2: row[27],
        icing_type: row[28],
        icing_intensity: row[29],
        icing_base_ft_msl: row[30],
        icing_top_ft_msl: row[31],
        icing_type_2: row[32],
        icing_intensity_1: row[33],
        icing_base_ft_msl_2: row[34],
        icing_top_ft_msl_2: row[35],
        visibility_statute_mi: row[36],
        wx_string: row[37],
        temp_c: row[38],
        wind_dir_degrees: row[39],
        wind_speed_kt: row[40],
        vert_gust_kt: row[41],
        report_type: row[42],
        raw_text: row[43], # Key
        raw_pirep_id: raw_pirep.id
      }.compact
      
      REDIS_PIREPS.call("rpush", "pireps", payload.to_json)
    end
  end
end
