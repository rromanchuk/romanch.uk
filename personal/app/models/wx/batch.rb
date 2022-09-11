module Wx
  class Batch < ApplicationRecord
    after_create_commit :process_batch!
    store_accessor :data, :s3_select_expression

    scope :pending, -> { where(processed_at: nil) }
    scope :complete, -> { where.not(processed_at: nil) }

    def public_url
      "https://romanch.uk/#{key}"
    end

    def process_batch!
      case report_type
      when 'aircraftreports'
        Wx::Pireps::Process.call(self)
      when 'metars'
        # Wx::Metars::Ingest.call(self)
      end
    end
  end
end
