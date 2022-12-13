# frozen_string_literal: true

class IngestTafsWorker < ApplicationWorker
  sidekiq_options retry: false, queue: :low

  def perform
    Wx::Tafs::Ingest.call
  end
end
