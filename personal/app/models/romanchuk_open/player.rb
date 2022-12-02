class RomanchukOpen::Player < ApplicationRecord
  include Sluggable

  has_many :golfers, dependent: :destroy
  has_many :tournaments, through: :golfers
  # https://github.com/rails/rails/blob/c202633f7f49c58aeb8e9e4459ba9dbccd65d801/activestorage/lib/active_storage/attached/model.rb#L129
  has_many :ro_photo_attachments, -> { where(name: :ro_photo) }, as: :record, class_name: "Attachment", inverse_of: :record, dependent: :destroy
  has_many :ro_photo_blobs, through: :ro_photo_attachments, class_name: "Blob", source: :blob

  def slug_candidates = %i[name]

  def should_generate_new_friendly_id?
    name_changed? || super
  end
end
