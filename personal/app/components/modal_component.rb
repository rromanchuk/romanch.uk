# frozen_string_literal: true

class ModalComponent < ViewComponent::Base
  renders_one :body

  attr_reader :target, :title
  def initialize()
   

  end
end
