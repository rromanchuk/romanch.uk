# frozen_string_literal: true

class ProcessWorker < ApplicationWorker
  sidekiq_options retry: false, queue: :low

  def perform
    Tds::Batch.pending.limit(30).each do |batch|
      batch.process_batch!
    end
  end
end
