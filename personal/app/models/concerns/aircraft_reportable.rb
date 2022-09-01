module AircraftReportable
  extend ActiveSupport::Concern
  
  included do
    include Dynamoid::Document
    table key: :raw_text, read_capacity: 1, write_capacity: 1
    range :receipt_time
    
    field :observation_time, :datetime, store_as_string: true # [1]
    
    # Midpoint- if the exact location of the Aircraft Report is not provided, the midpoint between two locations is assumed.
    field :mid_point_assumed # [2]
    
    # No time stamp - if a time stamp is wrong or not provided.
    field :no_time_stamp # [3]
  
    # Flight level range - if a range instead of a specific altitude is given for flight level information.
    field :flt_lvl_range # [4]
  
    # Above ground level (AGL)- if the flight level is expressed as AGL as
    # opposed to mean sea level (MSL). Or if the flight level is recorded as
    # "during descent" (DURD), in which case the surface elevation plus 100 ft.
    # is used from the closest identifier.
    field :above_ground_level_indicated # [5]
    
    # No flight level - if no flight level information can be deciphered from
    # the raw Aircraft Report. The decoder fills in the flight level with the
    # altitude of the cloud observation. If this information is unavailable,
    # then the altitude of icing is used. If icing information is absent, then
    # the altitude of turbulence is used.
    field :no_flt_lvl_range # [6]
    
    # Bad location - if the location from the "/OV" group is greater than 500 km
    # from the leading identifier, or if the location identifier is not
    # available. In this situation, the lat and lon from the leading identifier
    # is used.
    field :bad_location # [7]
    
    
    field :aircraft_ref # [8]
    field :latitude, :number # [9]
    field :longitude, :number # [10]
    field :altitude_ft_msl, :integer # [11]
    
    field :sky_condition, :array # computed from [12] through [17]
    field :sky_cover # [12]
    field :cloud_base_ft_msl, :integer # [13]
    field :cloud_top_ft_msl, :integer # [14]
    # sky_condition[1]
    field :sky_cover_2 # [15]
    field :cloud_base_ft_msl_2, :integer # [16]
    field :cloud_top_ft_msl_2, :integer # [17]
    
    field :turbulence_condition, :array # computed from [18] through [27]
    # turbulence_condition[0]
    field :turbulence_type # [18]
    field :turbulence_intensity # [19]
    field :turbulence_base_ft_msl, :inter # [20]
    field :turbulence_top_ft_msl, :integer # [21]
    field :turbulence_freq # [22]
    # turbulence_condition[1]
    field :turbulence_type_2 # [23]
    field :turbulence_intensity_2 # [24]
    field :turbulence_base_ft_msl_2, :inter # [25]
    field :turbulence_top_ft_msl_2, :integer # [26]
    field :turbulence_freq_2 # [27]
    
    field :icing_type # [28]
    field :icing_intensity # [29]
    field :icing_base_ft_msl0, :integer # [30]
    field :icing_top_ft_msl, :integer # [31]
    
    field :visibility_statute_mi, :integer # [32]
    field :wx_string
    field :temp_c, :number
    field :wind_dir_degrees, :integer
    field :wind_speed_kt, :integer
    field :vert_gust_kt, :integer
    field :report_type
    # field :raw_text
  end
end