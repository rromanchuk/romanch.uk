module Wx
  module Metars
    class Ingest < Wx::Ingest
      def report_type
        'metars'
      end
    end
  end
end
