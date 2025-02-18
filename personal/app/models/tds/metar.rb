module Tds
  class Metar < ApplicationRecord
    self.implicit_order_column = 'observation_time'
    #include Searchable
    include PgSearch::Model
    SEARCH_AGAINST = %i[raw_text]
    belongs_to :batch, counter_cache: :metars_count
    belongs_to :station, optional: true
    pg_search_scope :search, against: SEARCH_AGAINST

    # pg_search_scope :search, against: {
    #     station_id: 'A',
    #     wx_string: 'B',
    #     flight_category: 'C',
    #     raw_text: 'D'
    #   },
    #   using: {
    #     trigram: {},
    #     tsearch: { 
    #       dictionary: "simple",
    #       tsvector_column: 'searchable_tsearch'
    #     }
    #   }

      # pg_search_scope :search, against: :raw_text,
      #   using: {
      #     tsearch: { 
      #       dictionary: "simple",
      #       tsvector_column: 'searchable_tsearch'
      #     }
      #   }
    
    def self.cached_count
      Rails.cache.fetch("Tds::Metar.count", expires_in: 24.hours) do
        Tds::Metar.count
      end
    end

    def cleanup
      self.sky_condition = sky_condition.presence
    end
  end
end
