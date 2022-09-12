module Pireps
  class Save < Service
    let(:redis) { RedisClient.new }
    let(:batch) { redis.call('lpop', 'pireps', 500) || [] }
    let(:records) { batch.map { |json| JSON.parse(json) } }

    def call
      records.each do |record|
        save_record(record)
      end
      # Pireps::PilotReport.create(records)
      true
    end

    def save_record(record)
      RawReport.upsert(record)
    rescue StandardError => e
      Rails.logger.error "Error saving record: #{e.message}, #{record[:raw_text]}"
      redis.call('rpush', 'failed_pireps', record.to_json)
      Sentry.capture_exception(e)
    rescue PG::UniqueViolation => e
      Rails.logger.error "Record already exists: #{record[:raw_text]}"
    end
  end
end
