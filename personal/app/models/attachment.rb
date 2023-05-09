class Attachment < LegacyRecord
  belongs_to :record, polymorphic: true, touch: true
  belongs_to :blob, autosave: true

  scope :tournament, -> { where(record_type: 'RomanchukOpen::Tournament') }
end