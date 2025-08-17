# frozen_string_literal: true

class IngestTafsWorker < ApplicationWorker
  sidekiq_options retry: false, queue: :low

  def perform
    Tds::Tafs::Ingest.call
  end
end
