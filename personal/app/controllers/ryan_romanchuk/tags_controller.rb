
module RyanRomanchuk
  class TagsController < ApplicationController
    let(:post) { Post.friendly.find(params[:post_id]) }
    let(:post_tags) do
      if params[:post_id]
        post.tag_names
      else
        Gutentag::Tag.names_for_scope(RyanRomanchuk::Post)
      end
    end

    def index
      
    end
  end
end