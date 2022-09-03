module Pireps
  class RawReport < ApplicationRecord
    include Turbo::Broadcastable
    belongs_to :batch_file

    scope :pireps, -> { where(report_type: 'PIREP') }
    scope :aireps, -> { where(report_type: 'AIREP') }

    def dyn
      PilotReport.find raw_text
    end
  end
end