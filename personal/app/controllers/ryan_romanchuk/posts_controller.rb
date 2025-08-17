module RyanRomanchuk
  class PostsController < ApplicationController
    allow_unauthenticated_access only: %i[ show index recently_updated ]
    before_action :set_breadcrumbs

    let(:dr_pagy)
    let(:post) { Post.includes(:tags).friendly.find(params[:id]) }

    let(:posts) do
      relation = apply_filter
      @dr_pagy, records = pagy(relation, items: 25)
      records
    end

    def show
      Rails.logger.info authenticated?
      add_breadcrumb('Posts', posts_url)
      add_breadcrumb(post.title)
      unless allowed_to?(:show?, post, with: RyanRomanchuk::PostPolicy)
       raise ActionController::RoutingError, 'Not Found'
      end
    end

    def new
      add_breadcrumb('Posts', posts_url)
      add_breadcrumb('New')
      @new_post = Post.new
    end

    def index
      authorize! with: RyanRomanchuk::PostPolicy
    end

    def edit
      add_breadcrumb(post.title, post_url(post))
      add_breadcrumb('Edit')
    end

    def create
      @new_post = Post.new(post_params)
      if @new_post.save
        redirect_to post_path(@new_post), status: :see_other
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      post.update!(post_params)
      redirect_to posts_path, status: :see_other
    end

    def destroy
      post.destroy
      redirect_to posts_path, status: :see_other
    end

    def recently_updated
      @posts = Post.published.recently_modified.limit(4)
    end

    private

    def apply_filter
      if (q = params[:q].presence)
        add_breadcrumb('Posts', posts_url)
        add_breadcrumb('Search')
        authorized_scope(Post.search(q))
      elsif (tag_name = params[:tag_name])
        add_breadcrumb('Posts', posts_url)
        add_breadcrumb('Tagged', tags_url)
        add_breadcrumb(tag_name)
        authorized_scope(Post.tagged_with(names: [tag_name], match: :any))
      else
        authorized_scope(Post.recent)
      end
    end

    def post_params
      params.require(:ryan_romanchuk_post).permit(:published, :markdown_content, :html_content, :title, :description, :tags_as_string)
    end
  end
end