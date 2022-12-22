module Wx
  class Metar < ApplicationRecord
    SEARCH_AGAINST = %i[raw_text]
    self.implicit_order_column = 'observation_time'
    include Searchable

    belongs_to :batch, counter_cache: :metars_count
    pg_search_scope :search, against: {
        station_id: 'A',
        wx_string: 'B',
        flight_category: 'C',
        raw_text: 'D'
      },
      using: {
        trigram: {},
        tsearch: { 
          dictionary: "simple",
          tsvector_column: 'searchable_tsearch'
        }
      }

    def cleanup
      self.sky_condition = sky_condition.presence
    end
  end
end
