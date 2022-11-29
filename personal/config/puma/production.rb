# This is automatically loaded when RAILS_ENV, or -e flag is passed as staging.
# Set global defaults, and handle someone running bin/puma outside the context of systemd
# https://github.com/puma/puma#configuration-file
workers 2
threads 1, 3
directory '/var/www/romanch.uk/current'

bind 'unix:///home/ubuntu/tmp/sockets/puma.sock'

preload_app!


#activate_control_app 'unix:///home/ubuntu/tmp/sockets/pumactl.sock', { auth_token: 'romanch.uk' }

persistent_timeout 75

x = nil
on_worker_boot do
  x = Sidekiq.configure_embed do |config|
    # config.logger.level = Logger::DEBUG
    config.queues = %w[default]
    config.concurrency = 2
  end
  x.run
end

on_worker_shutdown do
  x&.stop
end