module Tds
  class Batch < ApplicationRecord
    after_create_commit :process_batch!
    store_accessor :data, :s3_select_expression

    has_many :pireps
    has_many :aireps
    has_many :metars

    scope :pending, -> { where(processed_at: nil, failed_at: nil) }
    scope :failed, -> { where.not(failed_at: nil) }
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
        Tds::Pireps::Process.async_call(id)
      when 'metars'
        Tds::Metars::Process.async_call(id)
      when 'tafs'
        Tds::Tafs::Process.async_call(id)
      end
    end
  end
end
