class Post < ApplicationRecord
  Gutentag::ActiveRecord.call self
  extend FriendlyId
  friendly_id :title, use: :slugged

  def tags_as_string
    tag_names.join(", ")
  end
  
  # Split up the provided value by commas and (optional) spaces.
  def tags_as_string=(string)
    self.tag_names = string.split(/,\s*/)
  end
end