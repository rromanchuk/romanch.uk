module Wx
  class DefinitionRowComponent < ViewComponent::Base
    renders_one :dt
    renders_one :dd
    
    def initialize(should_render = true)
      super()
      @should_render = should_render
    end
    
    def render?
      @should_render
    end
  end
end