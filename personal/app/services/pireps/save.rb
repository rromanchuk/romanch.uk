module Pireps
  class Save < Service
    let(:redis) { RedisClient.new }
    let(:batch) { redis.call('lpop', 'pireps', 5) || [] }
    let(:records) { batch.map { |json| JSON.parse(json) } }

    def call
      records.each do |record|
        save_record(record)
      end
      # Pireps::PilotReport.create(records)
      nil
    end

    def save_record(record)
      RawReport.upsert(record)
    rescue StandardError => e
      RedisClient.new.call('rpush', 'failed_pireps', record.to_json)
      Rails.logger.info record
      Rails.logger.error e
      Sentry.capture_exception(e)
    end
  end
end
