module Tds
  module Tafs
    class Ingest < Tds::Ingest
      def report_type
        'tafs'
      end

      def file_type
        'cache.xml'
      end

      def content_type
        'text/xml'
      end
    end
  end
end
