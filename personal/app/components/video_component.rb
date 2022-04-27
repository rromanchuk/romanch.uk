# frozen_string_literal: true

class VideoComponent < ViewComponent::Base
  attr_reader :key
  def initialize(key:)
    @key = key
  end
end
