class User < ApplicationRecord
  extend FriendlyId
  friendly_id :username, use: :slugged
end
