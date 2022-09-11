module Wx
  class Airep < ApplicationRecord
    self.implicit_order_column = 'observation_time'
    belongs_to :batch

    scope :recent, -> { order(observation_time: :desc) }
  end
end
