module Wx
  module Tafs
    class Ingest < Wx::Ingest
      def report_type
        'tafs'
      end

      def file_type
        'cache.xml'
      end
    end
  end
end
