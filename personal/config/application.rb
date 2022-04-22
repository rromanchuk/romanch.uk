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



    config.assets.gzip = false

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.general = config_for(:general)
  end
end

Credentials = Rails.application.credentials.config[Rails.env.to_sym]
HOSTNAME = Socket.gethostname || 'unknown host'