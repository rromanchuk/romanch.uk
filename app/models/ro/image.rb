module Ro
  class Image < ApplicationRecord
    include Taggable
    #include Searchable
    include Sluggable
    belongs_to :tournament, optional: true, touch: true

    has_one_attached :file do |attachable|
      attachable.variant :thumb, resize_to_limit: [300, 300]
    end
    delegate_missing_to :file

    store_accessor :meta, :caption, :title

    scope :positioned, -> { order(position: :asc) }

    def slug_candidates = %i[filename title caption]

    def should_generate_new_friendly_id?
      meta_changed? || super
    end
  end
end