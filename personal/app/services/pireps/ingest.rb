require 'down'
require 'aws-sdk-s3'

module Pireps
  class Ingest < Service

    let(:object) do 
      Aws::S3::Object.new(bucket_name: 'pireps',
        key: "pireps/#{year}/#{month}/#{day}/#{prefix}_aircraftreports.cache.csv.gz",
        region: 'us-east-1'
      )
    end
    let(:redis) { RedisClient.new }
    let(:month) { Date.current.month }
    let(:year) { Date.current.year }
    let(:day) { Date.current.day }
    let(:minute) { Time.current.min }
    let(:prefix) { last_modified.strftime("%H%M") }
    let(:io) { Down.open("https://www.aviationweather.gov/adds/dataserver_current/current/aircraftreports.cache.csv.gz") }
    
    let(:current_etag) { io.data[:headers]["Etag"] }
    let(:previous_etag) { redis.call("GET", "etag") }
    let(:last_modified) { Time.parse(io.data[:headers]["Last-Modified"]) }

    
    def initialize()
      super()
      Pireps::IngestJob.perform_in(5.minutes)
    end

    def call
      unless new_data?
        puts "Data is up to date...bailing. Etag: #{previous_etag}"
        return
      end

      response = object.put(body: io)
      pirep = Pireps::RawPirep.create!(
        key: object.key,
        source_etag: current_etag,
        destination_etag: response.etag,
        source_last_modified_at: last_modified,
        source_fetched_at: Time.current
      )
      ap response
      ap pirep
      redis.call("SET", "etag", current_etag)
      pirep
    end

    def new_data?
      return true if previous_etag.nil?
      
      previous_etag != current_etag
    end
  end
end
