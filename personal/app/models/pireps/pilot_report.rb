# https://www.aviationweather.gov/dataserver/fields?datatype=airep
module Pireps
  # A PIREP is reported by a pilot to indicate encounters of hazardous weather
  # such as icing or turbulence. Both are transmitted in real-time via radio to
  # a ground station.
  class PilotReport
    include AircraftReportable
    include Turbo::Broadcastable
    

    field :ttl, :integer
    field :raw_pirep_id

    local_secondary_index hash_key: :raw_text, range_key: :latitude, projected_attributes: :keys_only
    after_create -> { broadcast_prepend_to :pilot_reports, partial: "pilot_reports/pilot_report", locals: { pilot_report: self }, target: "pilot_reports" }


    def broadcast!
      broadcast_prepend_to :pilot_reports, partial: "pireps/pilot_reports/pilot_report", locals: { pilot_report: self }, target: "pilot_reports"
    end

    # def id
    #   "pireps/pilot_reports/pilot_report"
    # end
  end
end
