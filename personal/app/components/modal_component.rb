# frozen_string_literal: true

class ModalComponent < ViewComponent::Base
  renders_one :body

  attr_reader :target, :title, :size, :close_footer
  def initialize(title: '', size: 'modal-fullscreen', close_footer: true)
    @size = size
    @title = title
    @close_footer = close_footer
  end
end
