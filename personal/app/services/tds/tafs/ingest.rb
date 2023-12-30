module Tds
  module Tafs
    class Ingest < Tds::Ingest
      def report_type
        'tafs'
      end

      def file_type
        'cache.xml.gz'
      end
    end
  end
end
