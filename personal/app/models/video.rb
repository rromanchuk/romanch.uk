class Video < ApplicationRecord
  SEARCH_AGAINST = %i[title description key]
  include Taggable
  include Searchable
  include Sluggable

  auto_strip_attributes :title, :description

  def slug_candidates = [:key]  
  def search_against = [:title, :description, :key]
end