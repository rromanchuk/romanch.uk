# frozen_string_literal: true

class VideoComponent < ViewComponent::Base
  attr_reader :video
  def initialize(video:)
    @video = video
  end
end
