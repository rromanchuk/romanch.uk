# frozen_string_literal: true

class VideoComponent < ViewComponent::Base
  attr_reader :config
  def initialize(config: {})
    @config = config
  end
end
