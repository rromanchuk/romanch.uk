module Pireps
  class Save < Service
    let(:redis) { Redis.new }
    let(:batch) { redis.call('lpop', 'pireps', 50) || [] }
    let(:records) { batch.map { |json| JSON.parse(json) } }
    
    def call
      Pireps::PilotReport.import(records)
    end
  end
end
