# frozen_string_literal: true

class Post < LegacyRecord
  SEARCH_AGAINST = %i[title description markdown_content]

  include Sluggable
  include Searchable
  include Taggable

  pg_search_scope :search, against: %i[title markdown_content]
  validates_presence_of :title
  auto_strip_attributes :description, :title

  broadcasts_to ->(_post) { 'posts' }, inserts_by: :prepend
  scope :published, -> { where(published: true) }
  scope :recently_modified, -> { order(updated_at: :desc) }

  def slug_candidates = [:title]
end
