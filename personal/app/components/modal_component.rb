# frozen_string_literal: true

class ModalComponent < ViewComponent::Base
  renders_one :body

  attr_reader :target, :title, :size
  def initialize(title: '', size: 'modal-fullscreen')
    @size = size
    @title = title
  end
end
