class LegacyRecord < ApplicationRecord
  self.abstract_class = true
  self.implicit_order_column = 'created_at'

  scope :oldest, ->(column = implicit_order_column) { order(column => :asc) }
  scope :recent, ->(column = implicit_order_column) { order(column => :desc) }
  scope :random, -> { order(Arel.sql('RANDOM()')) }
  connects_to database: { writing: :legacy }
end