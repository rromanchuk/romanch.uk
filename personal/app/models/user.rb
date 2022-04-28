class User < ApplicationRecord
  include Sluggable

  def slug_candidates = [:username]
  
  def me?
    username&.to_sym == :ryan
  end
end
