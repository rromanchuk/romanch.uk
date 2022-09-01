module Pireps
  class Save < Service
    def call
      rows = RedisClient.new.call('lpop', 'pireps', 50)&.map do |json|
        JSON.parse(json)
      end
      Pireps::Pirep.import(rows)
    end
  end
end
