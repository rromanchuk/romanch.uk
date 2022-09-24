require 'aws-sdk-s3'
module Wx
  class Ingest < Service
    # CLIENTS
    let(:redis) { RedisClient.new }
    let(:object) do
      Aws::S3::Object.new(bucket_name: 'pireps',
                          key: "tds/#{report_type}/#{Rails.env}/#{year}/#{month}/#{day}/#{prefix}_#{report_type}.#{file_type}",
                          region: 'us-east-1')
    end

    let(:endpoint) { "https://www.aviationweather.gov/adds/dataserver_current/current/#{report_type}.#{file_type}" }
    let(:response) do
      HTTParty.get(endpoint,
                   headers: { "User-Agent": 'romanch.uk/1.0 (Ryan Romanchuk/Private Pilot; Personal Project; github.com/rromanchuk/romanch.uk)' })
    end

    # HEADERS
    let(:headers) { HTTParty.head(endpoint).headers }
    let(:content_length) { headers['content-length'].to_i }
    let(:last_modified) { Time.parse(headers['last-modified']) } # N/A, not passed when using filters
    let(:etag) { headers['etag'] } # N/A, not passed when using filters

    let(:previous_etag) { redis.call('GET', "#{report_type}_previous_etag") }
    let(:previous_last_modified) { redis.call('GET', "#{report_type}_previous_last_modified") }
    let(:batch) { Batch.new }

    # Time
    let(:start_time) { start_time_s ? Time.parse(start_time_s) : nil }
    let(:start_time_s) { previous_last_modified }

    let(:end_time) { last_modified }
    let(:end_time_s) { end_time.iso8601 }

    let(:month) { end_time.month }
    let(:year) { end_time.year }
    let(:day) { end_time.day }
    let(:hour) { end_time.strftime('h%H') }
    let(:minute) { end_time.strftime('m%M') }
    let(:prefix) { "#{hour}_#{minute}" }

    def call
      Rails.logger.info "Attempting to ingest data from #{endpoint}"
      return false unless new_data?

      Rails.logger.info headers

      batch.attributes = { key: object.key, content_length:, report_type:, start_time:, end_time:,
                           source_url: endpoint }
      upload!
    end

    def upload!
      object.put(body: response.body, storage_class: 'INTELLIGENT_TIERING', content_type: content_type)
      Rails.logger.info "Successfully uploaded to #{object.key}"
      batch.save!
      set_previous_keys!
    end

    def set_previous_keys!
      redis.call('SET', "#{report_type}_previous_etag", etag)
      redis.call('SET', "#{report_type}_previous_last_modified", end_time_s)
    end

    def report_type
      raise NotImplementedError
    end

    def file_type
      'cache.csv.gz'
    end

    def content_type
      'application/x-gzip'
    end

    def new_data?
      return true if previous_etag.nil?

      previous_etag != etag
    end
  end
end
