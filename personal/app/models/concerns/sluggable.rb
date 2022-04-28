module Sluggable
  extend ActiveSupport::Concern

  included do
    extend FriendlyId
    friendly_id :slug_source, use: :slugged
  end

  def slug_candidates
    raise NotImplementedError
  end
end