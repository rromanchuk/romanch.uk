module RyanRomanchuk
  class Post < ApplicationRecord
    SEARCH_AGAINST = %i[title description markdown_content]
  
    include Sluggable
    include Taggable

    # include PgSearch::Model
    # multisearchable against: %i[title markdown_content]
    # pg_search_scope :search, against: %i[title markdown_content]

    validates_presence_of :title
    auto_strip_attributes :description, :title
  

    scope :published, -> { where(published: true) }
    scope :recently_modified, -> { order(updated_at: :desc) }
  
    def slug_candidates = [:title]
  end
end