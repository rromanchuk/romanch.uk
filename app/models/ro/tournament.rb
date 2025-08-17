module Ro
  class Tournament < ApplicationRecord
    self.implicit_order_column = :ocurred_on
    include Sluggable
    has_many :golfers, dependent: :destroy
    has_many :players, through: :golfers
    has_many :images, dependent: :destroy

    has_one_attached :poster do |attachable|
      attachable.variant :thumb, resize_to_limit: [300, 300]
    end

    has_one_attached :newsletter

    store_accessor :data, :location

    def slug_candidates = %i[title ocurred_on]

    def year
      ocurred_on.year
    end

    def should_generate_new_friendly_id?
      title_changed? || super
    end
  end
end