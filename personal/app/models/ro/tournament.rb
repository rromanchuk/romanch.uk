module Ro
  class Tournament < ApplicationRecord
    self.implicit_order_column = :ocurred_on
    include Sluggable
    has_many :golfers, dependent: :destroy
    has_many :players, through: :golfers

    # has_many :ro_photo_attachments, lambda {
    #                                   where(name: :ro_photo)
    #                                 }, as: :record, class_name: 'Attachment', inverse_of: :record, dependent: :destroy
    # has_many :ro_photo_blobs, through: :ro_photo_attachments, class_name: 'Blob', source: :blob
    # accepts_nested_attributes_for :ro_photo_blobs, reject_if: :all_blank
    has_one_attached :poster
    has_many_attached :images
    store_accessor :data, :location, :newsletter

    def slug_candidates = %i[title ocurred_on]

    def year
      ocurred_on.year
    end

    def poster_image
      ro_photo_blobs.first&.key || 'https://via.placeholder.com/200'
    end

    def should_generate_new_friendly_id?
      title_changed? || super
    end
  end
end