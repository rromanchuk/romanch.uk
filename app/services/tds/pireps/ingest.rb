module Tds
  module Pireps
    class Ingest < Tds::Ingest
      def report_type
        'aircraftreports'
      end
    end
  end
end
