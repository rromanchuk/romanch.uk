# https://www.aviationweather.gov/dataserver/fields?datatype=airep
module Pireps
  # An Aircraft Report is a report of actual weather conditions encountered by
  # an aircraft while in flight. There are two types of reports. An AIREP is a
  # routine, often automated report of in-flight weather conditions such as wind
  # and temperature.
  class AircraftReport < PilotReport
    include AircraftReportable

    field :ttl, :integer
    field :raw_pirep_id

    local_secondary_index hash_key: :raw_text, range_key: :latitude, projected_attributes: :keys_only
  end
end
