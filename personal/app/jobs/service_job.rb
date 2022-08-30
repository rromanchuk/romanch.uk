# frozen_string_literal: true

class ServiceJob < ApplicationJob
  sidekiq_options retry: false
  queue_as :default

  def perform(service_name, ...)
    begin
      service_name.constantize.call(...)
    rescue StandardError => e
      Sentry.capture_exception(e)
    end
  end
end
