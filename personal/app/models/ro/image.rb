module Ro
  class Image < ApplicationRecord
    belongs_to :tournament, optional: true

    has_one_attached :file
    delegate_missing_to :file

    scope :positioned, -> { order(position: :asc) }
  end
end