# frozen_string_literal: true

class IngestMetarsWorker < ApplicationWorker
  sidekiq_options retry: false, queue: :low

  def perform
    Tds::Metars::Ingest.call
  end
end
