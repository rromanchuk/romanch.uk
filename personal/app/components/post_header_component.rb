# frozen_string_literal: true

class PostHeaderComponent < ViewComponent::Base
  attr_reader :post
  def initialize(post=Post.new)
    @post = post
  end
end