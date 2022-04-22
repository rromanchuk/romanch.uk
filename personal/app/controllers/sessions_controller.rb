class SessionsController < ApplicationController
  before_action :require_user!

  def logout
    logout!
  end
  
  # Virtual path for Cognito login
  def login
    redirect_to root_path
  end
end