# frozen_string_literal: true

class EditorComponent < ViewComponent::Base
  include ApplicationHelper
  attr_reader :post
  def initialize(post=Post.new)
    @post = post
  end
end
