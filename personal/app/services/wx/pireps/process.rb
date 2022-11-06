# rubocop:disable Metrics/MethodLength
require 'utils/csv/aircraft_report_tools'
module Wx
  module Pireps
    class Process < Wx::Process
      include Utils::Csv::AircraftReportTools

      def expression
        "SELECT * FROM s3object s where s._43 = 'PIREP' or s._43 = 'AIREP' or s._43 = 'Urgent PIREP'"
      end

      # @param [Hash] row
      # @return [Integer] num records saved
      def transform!(row)
        normalized_row = transform_row_columns(row)
        return 0 unless row.count == 45

        normalized_row[:batch_id] = batch.id
        report_type = normalized_row.delete(:report_type)
        case report_type
        when 'PIREP', 'Urgent PIREP'
          records = Wx::Pirep.insert(normalized_row, unique_by: :index_wx_pireps_uniqueness)
          CleanupPirepJob.perform_async(records.last)
          records.length
        when 'AIREP'
          Wx::Airep.insert(normalized_row, unique_by: :index_wx_aireps_uniqueness).length
        else
          raise(ArgumentError, "Unknown report type: #{report_type}")
        end
      end
    end
  end
end
