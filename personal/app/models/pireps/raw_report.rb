module Pireps
  class RawReport < ApplicationRecord
    include Turbo::Broadcastable
    belongs_to :batch_file

    scope :pireps, -> { where(report_type: 'PIREP') }
    scope :aireps, -> { where(report_type: 'AIREP') }

    def remarks
      %r{/RM\s(.+)}.match(raw_text)[1]
    end

    def urgent?
      /[UA]{3}/.match?(raw_text)
    end

    def identifier
      /(^\w{3,4})/.match(raw_text)[1]
    end

    # def find_dyn
    #   PilotReport.find(raw_text, range_key: receipt_time)
    # end

    # def dyn_prireps
    #   PilotReport.where(report_type: 'PIREP').scan_index_forward(false)
    # end
  end
end
