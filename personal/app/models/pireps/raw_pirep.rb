module Pireps
  class RawPirep < ApplicationRecord
    after_create_commit :ingest_pirep!
    scope :not_proceessed, -> { where(processed_at: nil) }


    def ingest_pirep!
      Pireps::Process.async_call(self)
    end
  end
end