require 'aws-sdk-s3'
require 'utils/csv/aircraft_report_tools'
require 'csv'

# https://docs.aws.amazon.com/sdk-for-ruby/v3/api/Aws/S3/Client.html#select_object_content-instance_method
module Pireps
  class Process < Service
    include Utils::Csv::AircraftReportTools
    attr_reader :batch_file

    let(:client) { Aws::S3::Client.new(region: 'us-east-1') }

    def initialize(batch_file=BatchFile.pending.first)
      super()
      @batch_file = batch_file
    end

    def params
      {
        bucket: :pireps, # required
        key: batch_file.key, # required
        expression_type: 'SQL', # required, accepts SQL,
        expression: "SELECT * FROM s3object s where s._43 = 'PIREP' or s._43 = 'AIREP'", # required
        input_serialization: {
          compression_type: 'GZIP',
          csv: {
            file_header_info: 'IGNORE' # accepts USE, NONE
          }
        },
        output_serialization: {
          csv: {}
        }
      }
    end

    def call
      return nil unless batch_file

      
      client.select_object_content(params) do |stream|
        stream.on_error_event do |event|
          Rails.logger.error event.error_message
          # catch unmodeled error event in the stream
          raise event
        end
        
        row_segments = []
        num_valid_records = 0
        # Callback for every event that arrives
        stream.on_event do |event|
          Rails.logger.debug "#{event.event_type} event received, num_records #{num_valid_records}"
          case event.event_type
          when :end
            Rails.logger.info "Updating batch file num_records #{num_valid_records}"
            batch_file.update!(processed_at: Time.current, num_records_processed: num_valid_records)
            Pireps::Save.async_call
          when :records
            raw_row_segment = event.payload.string
            row_segments << raw_row_segment
            next unless raw_row_segment.end_with?("\n")

            raw_row = row_segments.join('')
            row_segments = []
            Rails.logger.debug raw_row
            CSV.parse(raw_row) do |row|
              next unless row.count == 45
              normalized_row = transform_row_columns(row)
              normalized_row[:batch_file_id] = batch_file.id
              Rails.logger.info normalized_row
              RedisClient.new.call('rpush', 'pireps', normalized_row.to_json)
              num_valid_records += 1
            end
          end
        end
      end # end of stream
    end # call
  end
end
