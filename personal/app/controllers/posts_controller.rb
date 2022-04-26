class PostsController < ApplicationController

  before_action :require_me!, except: [:index, :show]
  let(:dr_pagy) 
  let(:post) { Post.friendly.find(params[:id]) }
  
  let(:posts) do
   if (tag_name = params[:tag_name])
      @dr_pagy = nil
      Post.tagged_with(names: [tag_name], match: :any)
    elsif (q = params[:q])
      @dr_pagy = nil
      PgSearch.multisearch(q).where(searchable_type: "Post").includes(:searchable)
    else
      @dr_pagy, _posts = pagy(Post.all, items: 10)
      _posts
    end
  end
  
  def show; end
  
  def new
    
    @new_post = Post.new
  end
   
  def edit

  end
  
  
  def create
    @new_post = Post.new(post_params)
    if @new_post.save
      redirect_to posts_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    post.update!(post_params)
    redirect_to post_path(post), status: 303
  end

  def destroy
    post.destroy
    redirect_to posts_path, status: 303
  end
  
  private
  
  def post_params
    params.require(:post).permit(:markdown_content, :html_content, :title, :description, :tags_as_string, :delta_content)
  end
end
