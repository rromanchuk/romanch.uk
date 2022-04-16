class PostsController < ApplicationController

  if Rails.env.production?
    http_basic_authenticate_with name: 'ryan',
                                 password: Credentials[:http_auth_pw]
  end

  let(:post) { Post.find(params[:id]) }
  let(:posts) { Post.all }
  def show; end
  
  def new
    @new_post = Post.new
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
    if post.update(post_params)
      redirect_to posts_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    post.destroy
    redirect_to posts_path
  end

  def post_params
    params.require(:post).permit(:body, :title, :description, :tags_as_string)
  end
end
