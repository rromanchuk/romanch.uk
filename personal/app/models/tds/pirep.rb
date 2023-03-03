module Tds
  class Pirep < ApplicationRecord
    # include Turbo::Broadcastable
    include Searchable
    self.implicit_order_column = 'observation_time'
    SEARCH_AGAINST = %i[raw_text]

    UAA = /UUA/
    STATION = /\w{3}/
    REMARKS = %r{/RM\s(?<remarks>.+)}
    OV = %r{/OV\s\w+}
    FL = %r{/FL(\d{3}|UNKN)}
    TP = %r{/TP\s\w{1,4}}
    SK = %r{/SK\s(\d{3}|UNKN)\s\w{3}\s\d{3}/(\d{3}|UNKN)\s\w{3}\s\d{3}}
    TA = %r{/TA\s-?\d{2}}
    WV = %r{/WV\s\d{3}\d{2,3}KT?}

    
    # after_create_commit -> { broadcast_prepend_later_to 'pireps' }
    # # after_update_commit -> { broadcast_replace_later_to 'pireps' }
    # after_destroy_commit -> { broadcast_remove_to 'pireps' }
    before_create :set_aircraft_type_designator

    belongs_to :batch, counter_cache: :pireps_count
    belongs_to :aircraft_type_designator, optional: true
    belongs_to :station, optional: true

    auto_strip_attributes :icing_condition, :turbulence_condition, :sky_condition

    # store_accessor :data, :remarks

    scope :uua, -> { where(urgent: true) }
    scope :ua, -> { where(urgent: false) }
    # scope :near, lambda { |point, radius|
    #   where(
    #     Arel.spatial(point)
    #       .st_distance(Pirep.arel_table[:location])
    #       .lt(radius)
    #   )
    # }

    # SELECT "wx_pireps".* FROM "wx_pireps" WHERE ST_Z(wx_pireps.location::geometry) > 5000;
    # scope :msl_above, lambda { |feet_msl|
    #   where("ST_Z(wx_pireps.location::geometry) > #{feet_msl}")
    # }
    
    # pg_search_scope :search, against: {
    #     station: 'A',
    #     aircraft_ref: 'B',
    #     remarks: 'C',
    #     raw_text: 'D'
    #   },
    #   using: {
    #     trigram: {},
    #     tsearch: { 
    #       dictionary: "simple",
    #       tsvector_column: 'searchable_tsearch'
    #     }
    #   }

    # scope :search_for, lambda { |term|
    #   joins(:pg_search_document).merge(
    #     PgSearch.multisearch(term).where(searchable_type: klass.to_s)
    #   )
    # }
    
    def self.cached_count
      Rails.cache.fetch("Tds::Pirep.count", expires_in: 24.hours) do
        Tds::Pirep.count
      end
    end

    def parsed_urgent? = Tds::Pirep::UAA.match?(raw_text)
    def parsed_remarks = REMARKS.match(raw_text)&.[](:remarks)
    def parsed_station = raw_text.match(STATION)[0]

    def set_aircraft_type_designator
      self.aircraft_type_designator = AircraftTypeDesignator.find_by(icao_code: aircraft_ref)
    end

    def cleanup
      set_aircraft_type_designator unless aircraft_type_designator
      self.remarks = parsed_remarks
      
      self.station = Station.find_or_create_by!(code: parsed_station) if parsed_station
      self.urgent = parsed_urgent?
      self.altitude_ft_msl = nil if altitude_ft_msl&.zero?
    end
  end
end
