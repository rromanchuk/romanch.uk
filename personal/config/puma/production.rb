# This is automatically loaded when RAILS_ENV, or -e flag is passed as staging.
# Set global defaults, and handle someone running bin/puma outside the context of systemd
# https://github.com/puma/puma#configuration-file
workers 2

directory '/var/www/romanch.uk/current'
bind 'unix:///home/ubuntu/tmp/sockets/puma.sock'

preload_app!


lowlevel_error_handler do |e|
  puts e
  [500, {}, ["An error has occurred, and engineers have been informed. Please reload the page. If you continue to have problems, contact support@example.com\n"]]
end

x = nil
on_worker_boot do
  puts "on_worker_boot"
  x = Sidekiq.configure_embed do |config|
    config.logger.level = Logger::DEBUG
    config.queues = %w[default low]
    config.concurrency = 2
    config.on(:startup) do
      puts "on startup"
      schedule_file = "config/schedule.yml"
      if File.exist?(schedule_file)
        Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
      end
    end
  end
  x.run
end

on_worker_shutdown do
  puts "on_worker_shutdown"
  x&.stop
end