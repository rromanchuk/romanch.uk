module Ro
  class Image < ApplicationRecord
    include Taggable
    #include Searchable
    include Sluggable
    belongs_to :tournament, optional: true, touch: true

    has_one_attached :file
    delegate_missing_to :file

    store_accessor :meta, :caption, :title

    scope :positioned, -> { order(position: :asc) }

    def slug_candidates = %i[filename title caption]

    
  end
end