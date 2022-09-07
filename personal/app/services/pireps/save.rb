module Pireps
  class Save < Service
    let(:redis) { RedisClient.new }
    let(:batch) { redis.call('lpop', 'pireps', 1000) || [] }
    let(:records) { batch.map { |json| JSON.parse(json) } }

    def call
      begin
        RawReport.upsert_all(records)
      rescue StandardError => e
        RedisClient.new.call('rpush', 'failed_pireps', records.to_json)
        Rails.logger.info record
        Rails.logger.error e
        Sentry.capture_exception(e)
      end
      # Pireps::PilotReport.import(records)
      # Pireps::PilotReport.create(records)
      nil
    end
  end
end
