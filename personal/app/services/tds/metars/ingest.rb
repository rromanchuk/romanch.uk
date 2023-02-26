module Tds
  module Metars
    class Ingest < Tds::Ingest
      def report_type
        'metars'
      end
    end
  end
end
