# frozen_string_literal: true
class Post < ApplicationRecord
  SEARCH_AGAINST = %i[title description markdown_content]

  include Sluggable
  include Searchable
  include Taggable
  include Turbo::Broadcastable
  


  pg_search_scope :search, against: %i[title markdown_content]
  validates_presence_of :title
  auto_strip_attributes :description, :title

  broadcasts_to ->(post) { "posts" }, inserts_by: :prepend
  scope :published, -> { where(published: true) }

  def slug_candidates = [:title]
end
