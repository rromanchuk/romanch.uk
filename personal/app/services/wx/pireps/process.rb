require 'utils/csv/aircraft_report_tools'
module Wx
  module Pireps
    class Process < Wx::Process
      include Utils::Csv::AircraftReportTools

      def expression
        "SELECT * FROM s3object s where s._43 = 'PIREP' or s._43 = 'AIREP'"
      end

      def transform!(row)
        normalized_row = transform_row_columns(row)
        return false unless row.count == 45

        normalized_row[:batch_id] = batch.id
        report_type = normalized_row.delete(:report_type)
        case report_type
        when 'PIREP'
          normalized_row[:urgent] = /[UA]{3}/.match?(normalized_row[:raw_text])
          Wx::Pirep.upsert(normalized_row, unique_by: :index_wx_pireps_uniqueness)
        when 'AIREP'
          Wx::Airep.upsert(normalized_row, unique_by: :index_wx_aireps_uniqueness)
        end

        true
      end
    end
  end
end
