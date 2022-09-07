module Pireps
  class Save < Service
    let(:redis) { RedisClient.new }
    let(:batch) { redis.call('lpop', 'pireps', 1000) || [] }
    let(:records) { batch.map { |json| JSON.parse(json) } }

    def call
      records.each do |record|
        RawReport.upsert(record)
      rescue StandardError => e
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
