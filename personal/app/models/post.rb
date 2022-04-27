class Post < ApplicationRecord
  include PgSearch::Model
  multisearchable against: [:title, :description, :markdown_content]
  pg_search_scope :search, against: [:title, :markdown_content]
  
  Gutentag::ActiveRecord.call self
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of :title

  def tags_as_string
    tag_names.join(", ")
  end
  
  # Split up the provided value by commas and (optional) spaces.
  def tags_as_string=(string)
    self.tag_names = string.split(/,\s*/)
  end
end
