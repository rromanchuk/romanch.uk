# frozen_string_literal: true

class Video < ApplicationRecord
  SEARCH_AGAINST = %i[title description key]
  include Taggable
  include Searchable
  include Sluggable

  belongs_to :post, optional: true
  has_one_attached :file

  auto_strip_attributes :title, :description

  def slug_candidates = %i[title key]
  def search_against = %i[title description key]

  def should_generate_new_friendly_id?
    title_changed?
  end
end
