
Dynamoid::Config.timestamps = false
Dynamoid::Config.store_attribute_with_nil_value = false
Dynamoid::Config.store_datetime_as_string = true
Dynamoid::Config.store_date_as_string = true
Dynamoid::Config.region = 'us-east-1'
Dynamoid::Config.warn_on_scan = true

# # In case a console/rake gets launched
# Dynamoid.configure do |config|
#   config.endpoint = "http://127.0.0.1:8000"
#   config.warn_on_scan = false
#   config.sync_retry_wait_seconds = 0
#   config.sync_retry_max_times = 3
#   config.access_key = "FAKE_ACCESS_KEY_ID"
#   config.secret_key = "FAKE_SECRET_ACCESS_KEY"
# end
