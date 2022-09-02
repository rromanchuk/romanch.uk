# https://www.aviationweather.gov/dataserver/fields?datatype=airep
module Pireps
  # A PIREP is reported by a pilot to indicate encounters of hazardous weather
  # such as icing or turbulence. Both are transmitted in real-time via radio to
  # a ground station.
  class PilotReport
    include AircraftReportable
    include Turbo::Broadcastable
    



    local_secondary_index hash_key: :raw_text, range_key: :latitude, projected_attributes: :keys_only
    
    after_create -> { broadcast_prepend_to :pilot_reports }
    after_update -> { broadcast_replace_to :pilot_reports }
    after_destroy -> { broadcast_remove_to :pilot_reports }

  end
end
