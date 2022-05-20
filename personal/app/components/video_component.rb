# frozen_string_literal: true

class VideoComponent < ViewComponent::Base
  attr_reader :video, :fill
  
  def initialize(video:, fill: true)
    @video = video
    @fill = fill
  end
end
