# frozen_string_literal: true

class ProcessWorker < ApplicationWorker
  sidekiq_options retry: false, queue: :low

  def perform
    Tds::Batch.pending.limit(10).each do |batch|
      batch.process_batch!
    end
  end
end
