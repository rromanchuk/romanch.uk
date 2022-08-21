class RomanchukOpen::Player < ApplicationRecord
  include Sluggable
  has_many :images, as: :imageable
  has_many :golfers
  has_many :tournaments, through: :golfers

  def slug_candidates = %i[name]

  def should_generate_new_friendly_id?
    name_changed?
  end
end
