module Tds
  class AircraftTypeDesignator < ApplicationRecord
    include Sluggable
    include Searchable
    SEARCH_AGAINST = %i[icao_code manufacturer model]

    pg_search_scope :search, against: %i[icao_code manufacturer model]

    store_accessor :data, :other_models
    def slug_candidates = %i[icao_code manufacturer model]
  end
end