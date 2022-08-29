class Attachment < ApplicationRecord
  belongs_to :record, polymorphic: true, touch: true
  belongs_to :asset, autosave: true
end