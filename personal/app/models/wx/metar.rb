module Wx
  class Metar < ApplicationRecord
    SEARCH_AGAINST = %i[raw_text]
    self.implicit_order_column = 'observation_time'
    include Searchable

    belongs_to :batch, counter_cache: :metars_count
    pg_search_scope :search, against: %i[raw_text]

    def cleanup
      self.sky_condition = sky_condition.presence
    end
  end
end
