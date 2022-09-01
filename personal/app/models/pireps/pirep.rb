# https://www.aviationweather.gov/dataserver/fields?datatype=airep
module Pireps
  class Pirep
    include Dynamoid::Document
    table name: :pireps, key: :raw_text, read_capacity: 1, write_capacity: 1
    range :receipt_time

    # field :receipt_time, :datetime, store_as_string: true
    field :observation_time, :datetime, store_as_string: true
    field :quality_control_flags
    field :aircraft_ref
    field :latitude, :number
    field :longitude, :number

    field :altitude_ft_msl, :integer
    field :sky_condition
    field :sky_cover
    field :cloud_base_ft_msl, :integer
    field :cloud_top_ft_msl, :integer
    field :sky_cover_2
    field :cloud_base_ft_msl_2, :integer
    field :cloud_top_ft_msl_2, :integer
    field :turbulence_condition
    field :turbulence_type
    field :turbulence_intensity
    field :turbulence_base_ft_msl, :inter
    field :turbulence_top_ft_msl, :integer
    field :turbulence_freq
    field :turbulence_type_2
    field :turbulence_intensity_2
    field :turbulence_base_ft_msl_2, :inter
    field :turbulence_top_ft_msl_2, :integer
    field :turbulence_freq_2
    field :icing_type
    field :icing_intensity
    field :icing_base_ft_msl0, :integer
    field :icing_top_ft_msl, :integer
    field :visibility_statute_mi, :integer
    field :wx_string
    field :temp_c, :number
    field :wind_dir_degrees, :integer
    field :wind_speed_kt, :integer
    field :vert_gust_kt, :integer
    field :report_type
    # field :raw_text

    field :ttl, :integer
    field :raw_pirep_id

    local_secondary_index hash_key: :raw_text, range_key: :latitude, projected_attributes: :keys_only


  end
end
