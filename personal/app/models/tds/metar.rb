module Tds
  class Metar < ApplicationRecord
    #SEARCH_AGAINST = %i[raw_text]
    self.implicit_order_column = 'observation_time'
    #include Searchable

    belongs_to :batch, counter_cache: :metars_count
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
        Wx::Metar.count
      end
    end

    def cleanup
      self.sky_condition = sky_condition.presence
    end
  end
end
