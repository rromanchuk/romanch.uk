class User < ApplicationRecord
  extend FriendlyId
  friendly_id :username, use: :slugged

  def me?
    username == :ryan
  end
end
