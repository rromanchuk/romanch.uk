module Pireps
  class Save < Service
    let(:redis) { RedisClient.new }
    let(:batch) { redis.call('lpop', 'pireps', 50) || [] }
    let(:records) { batch.map { |json| JSON.parse(json) } }

    def call
      records.each do |record|
        RawReport.create!(record)
      end
      # Pireps::PilotReport.import(records)
      # Pireps::PilotReport.create(records)
    rescue StandardError => e
    end
  end
end
