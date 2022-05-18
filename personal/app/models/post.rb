class Post < ApplicationRecord
  SEARCH_AGAINST = %i[title description markdown_content]

  include Sluggable
  include Searchable
  include Taggable
  has_many :videos
  has_many :images

  pg_search_scope :search, against: %i[title markdown_content]
  validates_presence_of :title
  auto_strip_attributes :description, :title

  scope :published, -> { where(published: true) }

  def slug_candidates = [:title]
end
