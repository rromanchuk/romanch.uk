class User < ApplicationRecord
  extend FriendlyId
  friendly_id :username, use: :slugged

  def me?
    username&.to_sym == :ryan
  end
end
