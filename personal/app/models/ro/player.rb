module Ro
  class Player < ApplicationRecord
    include Sluggable

    has_many :golfers, dependent: :destroy
    has_many :tournaments, through: :golfers
    has_one_attached :avatar


    def slug_candidates = %i[name]

    def should_generate_new_friendly_id?
      name_changed? || super
    end
  end
end