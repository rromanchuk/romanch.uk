# frozen_string_literal: true

class IngestPirepsWorker < ApplicationWorker
  sidekiq_options retry: false, queue: :low

  def perform
    Wx::Pireps::Ingest.call
  end
end
