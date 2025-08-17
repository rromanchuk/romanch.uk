module Personal
  def self.redis
    @redis ||= ConnectionPool.new do
      Redis.new
    end
  end
end