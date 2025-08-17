# frozen_string_literal: true

class PostBodyComponent < ViewComponent::Base
  attr_reader :post
  def initialize(post=Post.new)
    @post = post
  end
end