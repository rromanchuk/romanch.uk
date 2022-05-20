class UsersController < ApplicationController
  
  let(:user) { User.friendly.find params[:id] }
  let(:users) { User.recent }
  
  def show; end
  def index; end
  def me
    @user = current_user
    render :show
  end
end
