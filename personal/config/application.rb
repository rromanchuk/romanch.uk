require_relative "boot"

require "rails/all"


# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Personal
  class Application < Rails::Application
    require "utils/formatters/json"
    require "utils/formatters/lograge"
    require "custom_logger"

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    config.generators do |g|
      g.orm :active_record, primary_key_type: :uuid
    end

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.general = config_for(:general)

    config.logger = CustomLogger.logger
    config.log_formatter = Utils::Formatters::Json.new

    config.lograge.enabled = true
    config.colorize_logging = false
    config.lograge.ignore_actions = ['HomeController#status']
    config.lograge.formatter = Lograge::Formatters::Logstash.new
    config.lograge.custom_options = lambda do |event|
      { 
        url: event.payload[:url],
        ua: event.payload[:ua],
        user_id: event.payload[:user_id],
        amzn_oidc_identity: event.payload[:amzn_oidc_identity]
      }
    end
  end
end

Credentials = Rails.application.credentials.config[Rails.env.to_sym]
HOSTNAME = Socket.gethostname || 'unknown host'