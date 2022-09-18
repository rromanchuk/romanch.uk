class UsersController < ApplicationController
  before_action :set_breadcrumbs
  let(:user) { User.friendly.find params[:id] }
  let(:users) { User.recent }

  def show
    add_breadcrumb('Users', users_url)
    add_breadcrumb(user.name)
    render stream: true
  end
  
  def index
    add_breadcrumb('Users')
    render stream: true
  end

  def destroy
    authorize!
    user.destroy!
    redirect_to users_path, status: 303, notice: 'Post was successfully deleted.'
  end

  def new
    add_breadcrumb('Users', users_url)
    add_breadcrumb('New')
    @user = User.new
  end

  def create
    @user = User.new(post_params)
    authorize!
    if user.save
      redirect_to users_path, notice: 'Post was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    authorize!

    if user.update(user_params)
      redirect_to user_url(user), notice: 'Raw report was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
