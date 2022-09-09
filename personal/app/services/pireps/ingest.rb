require 'aws-sdk-s3'

module Pireps
  class Ingest < Service
    ENDPOINT = 'https://www.aviationweather.gov/adds/dataserver_current/httpparam' # 'https://www.aviationweather.gov/adds/dataserver_current/httpparam/aircraftreports.cache.csv.gz'
    let(:object) do
      Aws::S3::Object.new(bucket_name: 'pireps',
                          key: "files/aircraftreports/#{env}/#{year}/#{month}/#{day}/#{prefix}_aircraftreports.csv.gz",
                          region: 'us-east-1')
    end

    let(:req) { "#{ENDPOINT}#{params}" }
    let(:previous_request) { redis.call('GET', 'previous_request') }
    let(:params) do
      "?dataSource=aircraftreports&requestType=retrieve&format=csv&startTime=#{start_time_s}&endTime=#{end_time_s}&compression=gzip"
    end
    let(:start_time) { (Time.current - 1.hour).beginning_of_hour }
    let(:start_time_s) { start_time.iso8601 }
    let(:end_time) { start_time.end_of_hour }
    let(:end_time_s) { end_time.iso8601 }

    # Key path building
    let(:env) { Rails.env }
    let(:redis) { RedisClient.new }
    let(:month) { start_time.month }
    let(:year) { start_time.year }
    let(:day) { start_time.day }
    let(:prefix) { start_time.hour }
    let(:response) do
      HTTParty.get(req,
                   headers: { "User-Agent": 'romanch.uk/1.0 (Ryan Romanchuk/Private Pilot; Personal Project; github.com/rromanchuk/romanch.uk)' })
    end

    # Headers
    let(:headers) { file.data[:headers] }
    let(:current_etag) { headers['Etag'] } # N/A, not passed when using filters
    # let(:content_length) { headers['Content-Length'].to_i }
    let(:content_length) { response.headers['Content-Length'].to_i }
    let(:last_modified) { Time.parse(headers['Last-Modified']) } # N/A, not passed when using filters

    let(:previous_etag) { redis.call('GET', 'etag') }

    def initialize
      super()
    end

    def call
      Rails.logger.info "Attempting to ingest data from #{req}"

      unless new_data?
        Rails.logger.warn "Data is up to date...bailing.\netag: #{previous_etag}\n req: #{req}\nprevious_request: #{previous_request}"
        return
      end

      s3_resp = object.put(body: response.body, storage_class: 'INTELLIGENT_TIERING')
      Rails.logger.info "Successfully uploaded to #{object.key}"

      batch_file = BatchFile.create!(
        key: object.key,
        source_url: req,
        source_type: :aircraftreports,
        source_etag: start_time_s,
        content_length_bytes: content_length,
        destination_etag: s3_resp.etag,
        source_last_modified_at: end_time,
        source_fetched_at: Time.current,
        start_time: start_time_s,
        end_time: end_time_s
      )

      redis.call('SET', 'previous_request', req)
      # redis.call('SET', 'etag', current_etag)
      Rails.logger.info "Successfully ingested BatchFile #{batch_file.id}"
      batch_file
    end

    def new_data?
      return true if previous_request.nil?

      previous_request != req
    end
  end
end
