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

    def pending? 
      processed_at.nil? && failed_at.nil?
    end

    def self.pending_count
      Rails.cache.fetch("batch-pending-count", expires_in: 1.hour) do
        Tds::Batch.pending.count
      end
    end

    def self.complete_count
      Rails.cache.fetch("batch-complete-count", expires_in: 6.hours) do
        Tds::Batch.complete.count
      end
    end

    def self.failed_count
      Rails.cache.fetch("batch-failed-count", expires_in: 1.hour) do
        Tds::Batch.failed.count
      end
    end

    def process_batch!
      return if processed_at.present?
      
      case report_type
      when 'aircraftreports'
        Tds::Pireps::Process.call(id)
      when 'metars'
        Tds::Metars::Process.call(id)
      when 'tafs'
        Tds::Tafs::Process.call(id)
      end
    end
  end
end
