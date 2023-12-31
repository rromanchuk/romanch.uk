class ApplicationRecord < ActiveRecord::Base
  
  self.implicit_order_column = 'created_at'

  scope :oldest, ->(column = implicit_order_column) { order(column => :asc) }
  scope :recent, ->(column = implicit_order_column) { order(column => :desc) }
  scope :random, -> { order(Arel.sql('RANDOM()')) }

  self.abstract_class = true

  connects_to database: { writing: :primary, reading: :primary }

end
