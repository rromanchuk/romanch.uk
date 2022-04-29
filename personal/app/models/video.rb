class Video < ApplicationRecord
  SEARCH_AGAINST = %i[title description key]
  include Taggable
  include Searchable
  include Sluggable

  auto_strip_attributes :title, :description

  def slug_candidates = [:title, :key]  
  def search_against = [:title, :description, :key]


  def should_generate_new_friendly_id?
    title_changed?
  end
end