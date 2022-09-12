require 'utils/csv/metar_report_tools'
module Wx
  module Metars
    class Process < Wx::Process
      include Utils::Csv::MetarReportTools

      def expression
        "SELECT * FROM s3object s where s._43 = 'METAR' or s._43 = 'SPECI'"
      end

      # @param [Hash] row
      # @return [Integer] num records saved
      def transform!(row)
        normalized_row = transform_row_columns(row)
        return 0 unless row.count == 44

        normalized_row[:batch_id] = batch.id
        Wx::Metar.insert(normalized_row, unique_by: :index_wx_metars_uniqueness).length
      end
    end
  end
end
