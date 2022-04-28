class Post < ApplicationRecord
  SEARCH_AGAINST = [:title, :description, :markdown_content]
  
  include Sluggable
  include Searchable
  include Taggable

  pg_search_scope :search, against: [:title, :markdown_content]
  validates_presence_of :title
  auto_strip_attributes :description, :title

  

  def slug_candidates = [:key]

end
