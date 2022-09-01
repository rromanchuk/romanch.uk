if Rails.env.production? || Rails.env.development?
  Dynamoid.configure do |config|
    config.namespace = Rails.env
    config.region = "us-east-1"
    config.store_attribute_with_nil_value = false
    config.timestamps = false

  end
else
  # In case a console/rake gets launched
  Dynamoid.configure do |config|
    config.endpoint = "http://127.0.0.1:8000"
    config.namespace = Rails.env
    config.region = "us-east-1"
    config.warn_on_scan = false
    config.sync_retry_wait_seconds = 0
    config.sync_retry_max_times = 3
    config.access_key = "FAKE_ACCESS_KEY_ID"
    config.secret_key = "FAKE_SECRET_ACCESS_KEY"
    config.store_attribute_with_nil_value = false
    config.timestamps = false
  end
end