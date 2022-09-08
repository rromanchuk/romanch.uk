class TagsController < ApplicationController
  let(:post_tags) { Gutentag::Tag.names_for_scope(Post) }
  def index; end
end
