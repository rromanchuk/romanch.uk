class RomanchukOpen::Tournament < ApplicationRecord
  include Sluggable
  has_many :images, as: :imageable

  def slug_candidates = %i[title ocurred_on]
end
