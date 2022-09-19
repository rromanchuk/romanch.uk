class RomanchukOpen::Tournament < ApplicationRecord
  self.implicit_order_column = :ocurred_on
  include Sluggable
  has_many :golfers, dependent: :destroy
  has_many :players, through: :golfers

  has_many :ro_photo_attachments, lambda {
                                    where(name: :ro_photo)
                                  }, as: :record, class_name: 'Attachment', inverse_of: :record, dependent: :destroy
  has_many :ro_photo_blobs, through: :ro_photo_attachments, class_name: 'Blob', source: :blob
  accepts_nested_attributes_for :ro_photo_blobs, reject_if: :all_blank
  store_accessor :data, :location, :newsletter

  def slug_candidates = %i[title ocurred_on]

  def year
    ocurred_on.year
  end

  def poster_image
    ro_photo_blobs.first&.key || 'https://via.placeholder.com/200'
  end

  def should_generate_new_friendly_id?
    title_changed?
  end


  #private
  def seed_photos!
    start_num = ro_photo_attachments.count

    (start_num..start_num + 10).each do |i|
      blob = ro_photo_blobs.build
      blob.attributes = {title: "#{title} - #{i + 1}", key: "/static/romanchuk_open/#{year}_#{i + 1}.jpg", content_type: 'image/jpeg', tags_as_string: "#{year}"}
      blob.save!
    end
  end
end
