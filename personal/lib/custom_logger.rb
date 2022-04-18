
class CustomLogger < ActiveSupport::Logger
  
  def self.logger
    @logger ||= begin
      logger = ActiveSupport::Logger.new(File.join(Rails.root, 'log',
                                                   "#{Rails.env}.log"))
      logger.formatter = Utils::Formatters::Json.new
      logger.level = Logger::INFO
      logger
    end
  end


  delegate :info, :debug, :warn, :error, to: :logger
end
