module Wx
  class Pirep < ApplicationRecord
    self.implicit_order_column = 'observation_time'

    OV = %r{/OV\s\w+}
    FL = %r{/FL(\d{3}|UNKN)}
    TP = %r{/TP\s\w{1,4}}
    SK = %r{/SK\s(\d{3}|UNKN)\s\w{3}\s\d{3}/(\d{3}|UNKN)\s\w{3}\s\d{3}}
    TA = %r{/TA\s-?\d{2}}
    WV = %r{/WV\s\d{3}\d{2,3}KT?}

    include Turbo::Broadcastable
    after_create_commit -> { broadcast_prepend_later_to "pireps" }
    after_update_commit -> { broadcast_replace_later_to "pireps" }
    after_destroy_commit -> { broadcast_remove_to "pireps" }
    before_create :set_aircraft_type_designator

    belongs_to :batch, counter_cache: :pireps_count
    belongs_to :aircraft_type_designator, optional: true

    # store_accessor :data, :remarks, :sa_identifier

    scope :uua, -> { where(urgent: true) }
    scope :ua, -> { where(urgent: false) }
    scope :recent, -> { order(observation_time: :desc) }
    scope :near, -> (point, radius) {
      where(
        Arel.spatial(point)
          .st_distance(Pirep.arel_table[:location])
          .lt(radius)
      )
    }

    # SELECT "wx_pireps".* FROM "wx_pireps" WHERE ST_Z(wx_pireps.location::geometry) > 5000;
    scope :msl_above, -> (feet_msl) {
      where("ST_Z(wx_pireps.location::geometry) > #{feet_msl}")
    }

    def remarks = %r{/RM\s(?<remarks>.+)}.match(raw_text)&.[](:remarks)

    def set_aircraft_type_designator
      self.aircraft_type_designator = AircraftTypeDesignator.find_by(icao_code: aircraft_ref)
    end

    # def set_geometry!
    #   self.location = RGeo::Geographic.spherical_factory(srid: 4326, has_z_coordinate: true).point(longitude, latitude,
    #                                                                                                altitude_ft_msl)
    #   save!
    # end

    # def urgent?
    #   /[UA]{3}/.match?(raw_text)
    # end
  end
end
