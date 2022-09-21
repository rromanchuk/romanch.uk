class Blob < ApplicationRecord
  include Taggable
  include Searchable
  include Sluggable
  SEARCH_AGAINST = %i[title description key]

  store_accessor :data, :thumbnail_key, :aspect, :geo_location
  auto_strip_attributes :title
  auto_strip_attributes :thumbnail_key, :aspect, virtual: true

  has_many :attachments
  has_one :tournament_attachment, -> { tournament }, class_name: 'Attachment'

  scope :images, -> { where(content_type: %w[image/jpeg image/png image/gif]) }

  scope :videos, -> { where(content_type: %w[video/mp4]) }
  scope :streams, -> { where(content_type: %w[application/vnd.apple.mpegurl]) }
  scope :unattached, -> { where.missing(:attachments) }
  scope :flying, -> { where(slug: %w[l35 l35-departure ktoa kavx]) }

  # Returns true if the content_type of this blob is in the image range, like image/png.
  def image?
    content_type&.start_with?('image')
  end

  # Returns true if the content_type of this blob is in the video range, like video/mp4.
  def video?
    content_type.start_with?('video')
  end

  def stream?
    content_type.start_with?('application')
  end

  def slug_candidates = %i[title description key]

  def should_generate_new_friendly_id?
    title_changed?
  end
end
