class PostsController < ApplicationController
  let(:dr_pagy)
  let(:post) { Post.friendly.find(params[:id]) }

  let(:posts) do
    if (tag_name = params[:tag_name])
      relation = authorized_scope(Post.tagged_with(names: [tag_name], match: :any))
      @dr_pagy, _posts = pagy(relation, items: 10)
      _posts
    elsif (q = params[:q].presence)
      relation = authorized_scope(Post.search(q))
      @dr_pagy, _posts = pagy(relation, items: 10)
      _posts
    else
      relation = authorized_scope(Post.recent)
      @dr_pagy, _posts = pagy(relation, items: 10)
      _posts
    end
  end

  def show
    authorize! post
    fresh_when last_modified: post.updated_at.utc, etag: post
  end

  def new
    @new_post = Post.new
    authorize! @new_post
  end

  def index
    authorize!
  end

  def edit
    authorize! post
  end

  def create
    @new_post = Post.new(post_params)
    authorize! @new_post
    if @new_post.save
      redirect_to posts_path, notice: 'Post was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    authorize! post
    post.update!(post_params)
    redirect_to post_path(post), status: 303
  end

  def destroy
    authorize! post
    post.destroy
    redirect_to posts_path, status: 303, notice: 'Post was successfully deleted.'
  end

  private

  def post_params
    params.require(:post).permit(:published, :markdown_content, :html_content, :title, :description, :tags_as_string)
  end
end
