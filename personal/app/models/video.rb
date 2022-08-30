# frozen_string_literal: true
# @deprecated Use `Blob` instead.
class Video < ApplicationRecord
  SEARCH_AGAINST = %i[title description key]
  include Taggable
  include Searchable
  include Sluggable

  belongs_to :post, optional: true

  def slug_candidates = %i[title key]

  def should_generate_new_friendly_id?
    title_changed?
  end
end
