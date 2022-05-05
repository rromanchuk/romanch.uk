class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  self.implicit_order_column = 'created_at'

  scope :oldest, ->(column = :created_at) { order(column => :asc) }
  scope :recent, ->(column = :created_at) { order(column => :desc) }
  scope :random, -> { order(Arel.sql('RANDOM()')) }
end
