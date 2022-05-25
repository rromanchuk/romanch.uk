class RomanchukOpen::Tournament < ApplicationRecord
  include Sluggable
  has_many :images, as: :imageable
  store_accessor :data, :location, :newsletter

  def slug_candidates = %i[title ocurred_on]


  def poster_image
    images.first&.key || 'https://via.placeholder.com/200'
  end

  def should_generate_new_friendly_id?
    title_changed?
  end
end
