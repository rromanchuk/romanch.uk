module Sluggable
  extend ActiveSupport::Concern

  included do
    extend FriendlyId
    friendly_id :slug_candidates, use: :slugged
  end

  def slug_candidates
    raise NotImplementedError
  end
end