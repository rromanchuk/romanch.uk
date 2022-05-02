# frozen_string_literal: true

class ModalComponent < ViewComponent::Base
  renders_one :body

  attr_reader :target, :title, :size
  def initialize(size: 'modal-fullscreen')
   @size = size
    
  end
end
