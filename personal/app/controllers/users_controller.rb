class UsersController < ApplicationController
  before_action :require_user!
  let(:user) { User.find params[:id] }
  def show; end
  def me
    @user = current_user
    render :show
  end
end
