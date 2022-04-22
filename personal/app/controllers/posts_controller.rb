class PostsController < ApplicationController

  before_action :require_me!, except: [:index, :show]

  let(:post) { Post.friendly.find(params[:id]) }
  let(:posts) { Post.all }
  
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

  end

  def destroy
    post.destroy
    redirect_to posts_path
  end

  def post_params
    params.require(:post).permit(:body, :title, :description, :tags_as_string, :delta_content)
  end
end
