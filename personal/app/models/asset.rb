class Asset < ApplicationRecord
  include Taggable
  include Searchable
  include Sluggable
  SEARCH_AGAINST = %i[title description key]

  store_accessor :data, :thumbnail_key, :aspect
  
  has_many :attachments
  scope :unattached, -> { where.missing(:attachments) }


   # Returns true if the content_type of this blob is in the image range, like image/png.
   def image?
    content_type.start_with?("image")
  end

  # Returns true if the content_type of this blob is in the video range, like video/mp4.
  def video?
    content_type.start_with?("video")
  end

  def slug_candidates = %i[title key]

  def should_generate_new_friendly_id?
    title_changed?
  end
end