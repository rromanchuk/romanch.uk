class Image < ApplicationRecord
  SEARCH_AGAINST = %i[title caption key]

  include Taggable
  include Searchable
  include Sluggable
  
  has_one_attached :file
  belongs_to :imageable, polymorphic: true, optional: true

  auto_strip_attributes :title, :caption

  def slug_candidates = [:title, :key]


  def should_generate_new_friendly_id?
    title_changed?
  end
end
