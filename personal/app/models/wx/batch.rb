module Wx
  class Batch < ApplicationRecord
    after_create_commit :process_batch!
    store_accessor :data, :s3_select_expression

    has_many :pireps
    has_many :aireps
    has_many :metars

    scope :pending, -> { where(processed_at: nil) }
    scope :complete, -> { where.not(processed_at: nil) }
    scope :aircraftreports, -> { where(report_type: :aircraftreports) }
    scope :metars, -> { where(report_type: :metars) }
    scope :tafs, -> { where(report_type: :tafs) }

    def public_url
      "https://romanch.uk/#{key}"
    end

    def process_batch!
      case report_type
      when 'aircraftreports'
        Wx::Pireps::Process.async_call(self)
      when 'metars'
        Wx::Metars::Process.call(self)
      end
    end
  end
end
