module Pireps
  class IngestJob < ApplicationJob
    def perform
      Pireps::Ingest.call
    end
  end
end