module Tds
  class Airep < ApplicationRecord
    self.implicit_order_column = 'observation_time'
    belongs_to :batch, counter_cache: :aireps_count

    scope :recent, -> { order(observation_time: :desc) }
    def remarks = %r{/RM\s(?<remarks>.+)}.match(raw_text)&.[](:remarks)
  end
end
