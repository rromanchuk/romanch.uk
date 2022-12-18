module Wx
  class Metar < ApplicationRecord
    self.implicit_order_column = 'observation_time'
    belongs_to :batch, counter_cache: :metars_count

    def cleanup
      self.sky_condition = sky_condition.presence
    end
  end
end
