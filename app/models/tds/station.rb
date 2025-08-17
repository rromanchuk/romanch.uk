module Tds
  class Station < ApplicationRecord
    has_many :pireps, class_name: 'Tds::Pirep', foreign_key: 'station_id'
    has_many :tafs, class_name: 'Tds::Taf', foreign_key: 'station_id'
    has_many :metars, class_name: 'Tds::Metar', foreign_key: 'station_id'
  end
end