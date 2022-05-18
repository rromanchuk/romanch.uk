class Image < ApplicationRecord
  SEARCH_AGAINST = %i[title caption key]

  include Taggable
  include Searchable
  include Sluggable
  belongs_to :post, optional: true

  auto_strip_attributes :title, :caption

  def slug_candidates = [:title, :key]


  def should_generate_new_friendly_id?
    title_changed?
  end
end
