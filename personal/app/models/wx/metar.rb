module Wx
  class Metar < ApplicationRecord
    self.implicit_order_column = 'observation_time'
    belongs_to :batch, counter_cache: :metars_count
  end
end
