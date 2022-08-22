class RomanchukOpen::Tournament < ApplicationRecord
  include Sluggable
  has_many :images, as: :imageable
  has_many :golfers, dependent: :destroy
  has_many :players, through: :golfers
  store_accessor :data, :location, :newsletter

  def slug_candidates = %i[title ocurred_on]

  def year
    ocurred_on.year
  end
  
  def poster_image
    images.first&.key || 'https://via.placeholder.com/200'
  end

  def should_generate_new_friendly_id?
    title_changed?
  end
end
