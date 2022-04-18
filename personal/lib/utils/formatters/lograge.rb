# frozen_string_literal: true

require 'oj'
module Utils
  module Formatters
    class Lograge
      def call(data)
        datadog_line = {
          duration: data.delete(:duration),
          ddsource: :ruby
        }.merge!(format(data))

        "#{::Oj.dump(datadog_line, mode: :compat)}"
      end

      def format(data)
        formatted_hash = {}
        status_code = data.delete(:status)
        http_method = data.delete(:method)
        request_id = data.delete(:request_id)
        time = Time.now.iso8601

        formatted_hash[:service] = data.delete(:service)
        formatted_hash[:hostname] = data.delete(:hostname)
        formatted_hash[:dd] = data.delete(:dd)
        formatted_hash[:logger] = {name: :lograge}
        formatted_hash[:time] = time
        formatted_hash[:network] = {client: {ip: data.delete(:ip)}}
        formatted_hash[:usr] = {id: data.delete(:user_id), name: data.delete(:name), email: data.delete(:email)}.compact
        formatted_hash[:http] = {request_id: request_id, version: data.delete(:http_version), status_code: status_code, url: data.delete(:url), useragent: data.delete(:ua), method: http_method, url_details: {path: data.delete(:path), params: data.delete(:params)}}
        if data[:exception]
          kind, message = data.delete(:exception)
          formatted_hash[:error] = {kind: kind, message: message}
        end

        formatted_hash[:severity] = case status_code
        when 200...299
          "OK"
        when 300...299
          "INFO"
        when 400...499
          "WARN"
        when 500...600
          "ERROR"
        else
          "UNKNOWN"
        end

        # formatted_hash[:message] = "#{status_code} #{http_method}  -- #{format_hash(data)}"
        formatted_hash
      end

      def format_message(data)
        if data[:exception]
          kind, message = data[:exception]
          "#{kind} #{message}"
        else
          (data[:path]).to_s
        end
      end

      def format_hash(hash)
        hash.keys.sort.map { |key| "#{key}=#{hash[key]}" }.join(" ")
      end
    end
  end
end
