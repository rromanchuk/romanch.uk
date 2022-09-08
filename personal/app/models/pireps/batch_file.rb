module Pireps
  class BatchFile < ApplicationRecord
    after_create_commit :process_batch_file!
    scope :pending, -> { where(processed_at: nil) }
    scope :complete, -> { where.not(processed_at: nil) }

    store_accessor :data, :start_time, :end_time

    def process_batch_file!
      # Pireps::Process.call(self)
    end
  end
end
