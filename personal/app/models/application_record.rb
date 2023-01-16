class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  self.implicit_order_column = 'created_at'

  scope :oldest, ->(column = implicit_order_column) { order(column => :asc) }
  scope :recent, ->(column = implicit_order_column) { order(column => :desc) }
  scope :random, -> { order(Arel.sql('RANDOM()')) }
end
