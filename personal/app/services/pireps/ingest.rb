require 'down'
require 'aws-sdk-s3'

module Pireps
  class Ingest < Service

    let(:object) { Aws::S3::Object.new('pireps', "pireps/#{year}/#{month}/#{day}/#{prefix}_aircraftreports.cache.csv.gz") }
    let(:month) { Date.current.month }
    let(:year) { Date.current.year }
    let(:day) { Date.current.day }
    let(:minute) { Time.current.min }
    let(:prefix) { last_modified.strftime("%H%M") }
    let(:io) { Down.open("https://www.aviationweather.gov/adds/dataserver_current/current/aircraftreports.cache.csv.gz") }
    
    let(:current_etag) { io.data[:headers]["Etag"].unnpack }
    let(:previous_etag) { Rails.cache.read('etag') }
    let(:last_modified) { Time.parse(io.data[:headers]["Last-Modified"]) }

    
    def initialize()
      super()
    end

    def call
      return unless new_data?

      ap object.put(body: io)
      
      Rails.cache.write('etag', current_etag, expires_in: 5.minutes)
    end

    def new_data?
      return true if previous_etag.nil?
      
      previous_etag != current_etag
    end
  end
end
