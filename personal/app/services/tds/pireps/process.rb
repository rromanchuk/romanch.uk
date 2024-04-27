# rubocop:disable all
module Tds
  module Pireps
    class Process < Tds::Process
      include Tools

      def expression
        "SELECT * FROM s3object s where s._43 = 'PIREP' or s._43 = 'AIREP' or s._43 = 'Urgent PIREP'"
      end

      # @param [Hash] row
      # @return [Integer] num records saved
      def transform!(row)
        puts "Row count: #{row.count}"
        return 0 unless row.count == 44

       
        report_type = report_type(row)
        puts "Report type: #{report_type}"
        #Rails.logger.info "Inserting a record for report type #{report_type}"
        case report_type
        when 'PIREP'
          normalized_row = transform_pirep(row)
          normalized_row[:batch_id] = batch.id
          puts normalized_row
          records = Tds::Pirep.insert(normalized_row, unique_by: :index_tds_pireps_uniqueness)
          return 0 if records.empty?
          
          #CleanupPirepJob.perform_async(records.last[:id])
          records.length
        when 'Urgent PIREP'
          normalized_row = transform_pirep(row)
          normalized_row[:batch_id] = batch.id
          normalized_row[:urgent] = true
          records = Tds::Pirep.insert(normalized_row, unique_by: :index_tds_pireps_uniqueness)
          return 0 if records.empty?

          Rails.logger.info "UUA record found #{records.last[:id]}"
          #CleanupPirepJob.perform_async(records.last[:id])
          records.length
        when 'AIREP'
          normalized_row = transform_airep(row)
          normalized_row[:batch_id] = batch.id
          Tds::Airep.insert(normalized_row, unique_by: :index_tds_aireps_uniqueness).length
        else
          raise(ArgumentError, "Unknown report type: #{report_type}")
        end
      end
    end
  end
end
