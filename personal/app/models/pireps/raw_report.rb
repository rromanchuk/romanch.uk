module Pireps
  class RawReport < ApplicationRecord
    self.implicit_order_column = 'receipt_time'
    include Turbo::Broadcastable

    belongs_to :batch_file
    before_create :before_create_tasks

    store_accessor :data, :remarks, :sa_identifier

    scope :pireps, -> { where(report_type: 'PIREP') }
    scope :aireps, -> { where(report_type: 'AIREP') }
    scope :urgent, -> { where(urgent: true, report_type: 'PIREP') }

    # def find_dyn
    #   PilotReport.find(raw_text, range_key: receipt_time)
    # end

    # def dyn_prireps
    #   PilotReport.where(report_type: 'PIREP').scan_index_forward(false)
    # end
    # private

    def before_create_tasks
      self.urgent = /[UA]{3}/.match?(raw_text)
      self.remarks = %r{/RM\s(?<remarks>.+)}.match(raw_text)&.[](:remarks)
      self.sa_identifier = /(?<identifier>^\w{3})/.match(raw_text)&.[](:identifier)
    end
  end
end
