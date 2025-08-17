require 'oj'
module Utils
  module Formatters
    class Json < ActiveSupport::Logger::SimpleFormatter
      def call(severity, timestamp, _progname, message)
        datadog_line = {
          date: timestamp.iso8601,
          status: severity,
          source: :ruby,
          logger: { name: :rails },
          message: format_message(message).to_s
        }.merge!(format(message))

        # future self. Do not touch this line. Yes, it really is this complicated
        "#{::Oj.dump(datadog_line, mode: :compat)}\n"
      end

      def format(message)
        case message
        when ::String
          {}
        when ::Exception
          format_exception(message)
        when ::Hash
          { data: message }
        else
          {}
        end
      end

      def format_message(data)
        if data.is_a?(String)
          data
        elsif data.is_a?(Exception)
          data.message
        elsif data.is_a?(Hash)
          data.keys.sort.map { |key| "#{key}=#{data[key]}" }.join(' ')
        end
      end

      def dd(progname)
        {}
      end

      def format_exception(exception)
        {
          error: {
            message: exception.message,
            stack: exception.backtrace&.take(5)&.join("\n"),
            kind: exception.class
          }
        }
      end
    end
  end
end