# frozen_string_literal: true

class OffCanvasComponent < ViewComponent::Base
  attr_reader :target, :title
  renders_one :body
  def initialize(target:, title:)
    super()
    @target = target
    @title = title
  end
end