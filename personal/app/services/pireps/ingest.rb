require 'down'
require 'aws-sdk-s3'
require 'sidekiq/api'

module Pireps
  class Ingest < Service
    ENDPOINT = 'https://www.aviationweather.gov/adds/dataserver_current/current/aircraftreports.cache.csv.gz'
    let(:object) do
      Aws::S3::Object.new(bucket_name: 'pireps',
                          key: "current_aircraftreports/#{year}/#{month}/#{day}/#{prefix}_aircraftreports.cache.csv.gz",
                          region: 'us-east-1')
    end
    let(:redis) { RedisClient.new }
    let(:month) { Date.current.month }
    let(:year) { Date.current.year }
    let(:day) { Date.current.day }
    let(:minute) { Time.current.min }
    let(:prefix) { last_modified.strftime('%H%M') }
    let(:io) { Down.open(ENDPOINT) }

    # Headers
    let(:current_etag) { io.data[:headers]['Etag'] }
    let(:content_length) { io.data[:headers]['Content-Length'].to_i }
    let(:last_modified) { Time.parse(io.data[:headers]['Last-Modified']) }

    let(:previous_etag) { redis.call('GET', 'etag') }
    

    def initialize
      super()
      # Poorman's scheduler
      if Sidekiq::ScheduledSet.new.size == 0
        time = 5
        50.times do
          Pireps::Ingest.perform_at(time.minutes.from_now)
          time += 5
        end
      end
    end

    def call
      unless new_data?
        Rails.logger.debug "Data is up to date...bailing. Etag: #{previous_etag}"
        return
      end

      resp = object.put(body: io, storage_class: 'INTELLIGENT_TIERING')
      pirep = Pireps::BatchFile.create!(
        key: object.key,
        source_url: ENDPOINT,
        source_type: :aircraftreports,
        source_etag: current_etag,
        content_length_bytes: content_length,
        destination_etag: resp.etag,
        source_last_modified_at: last_modified,
        source_fetched_at: Time.current
      )

      redis.call('SET', 'etag', current_etag)
      pirep
    end

    def new_data?
      return true if previous_etag.nil?

      previous_etag != current_etag
    end
  end
end
