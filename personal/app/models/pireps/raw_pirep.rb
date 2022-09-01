module Pireps
  class RawPirep < ApplicationRecord
    after_create_commit :ingest_pirep!


    def ingest_pirep!
      Pireps::Ingest.async_call(self)
    end
  end
end