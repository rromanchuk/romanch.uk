# rubocop:disable all
require 'csv'
require 'aws-sdk-s3'
module Wx
  class Process < Service
    attr_reader :batch

    let(:client) { Aws::S3::Client.new(region: 'us-east-1') }
    let(:params) do
      {
        bucket: :pireps, # required
        key: batch.key, # required
        expression_type: 'SQL', # required, accepts SQL
        expression:, # required,
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

    def initialize(batch_id)
      super()
      @batch = Batch.find batch_id
    end

    def call
      return nil unless batch

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
          case event.event_type
          when :end
            Rails.logger.info "Updating batch file num_records #{num_valid_records}"
            batch.update!(processed_at: Time.current, num_records_processed: num_valid_records,
                          s3_select_expression: expression)
          when :records
            raw_row_segment = event.payload.string
            row_segments << raw_row_segment
            next unless raw_row_segment.end_with?("\n")

            raw_row = row_segments.join('')
            row_segments = []
            Rails.logger.debug raw_row
            CSV.parse(raw_row) do |row|
              num_valid_records += transform!(row)
            end
          end
        end
      end # end of stream
    rescue StandardError => e
      Rails.logger.error e
      Sentry.capture_exception(e)
      batch.update!(failed_at: Time.current)
      nil
    end # call

    def expression
      raise NotImplementedError
    end

    # @param [Hash] row
    # @return [Integer] num records saved
    def transform!(row)
      raise NotImplementedError
    end
  end
end
