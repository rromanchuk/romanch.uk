class Image < ApplicationRecord
  SEARCH_AGAINST = %i[title caption key]

  include Taggable
  include Searchable
  include Sluggable

  auto_strip_attributes :title, :caption

  def slug_candidates = [:key]
end
