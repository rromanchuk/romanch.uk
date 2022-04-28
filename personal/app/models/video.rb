class Video < ApplicationRecord
  extend FriendlyId
  friendly_id :key, use: :slugged
end