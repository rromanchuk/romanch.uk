class Image < ApplicationRecord
  extend FriendlyId
  friendly_id :key, use: :slugged
end