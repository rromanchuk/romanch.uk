module Pireps
  class BatchFile < ApplicationRecord
    after_create_commit :process_batch_file!
    scope :not_proceessed, -> { where(processed_at: nil) }


    def process_batch_file!
      Pireps::Process.async_call(self)
    end
  end
end