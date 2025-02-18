class SessionsController < ApplicationController
  before_action :require_user!, only: %i[account]

  def logout
    logout!
    redirect_to root_path, notice: 'You have been logged out.'
  end

  def apple_signin; end

  def sign_in
    find_by_alb
    ap current_user
  end

  def account; end


  # Virtual path for ALB cognito authentication on the ALB listener. The url
  # path of /login with will require valid session and redirect to hosted
  # cognito UI. If you want to forece non-alb terminated oauth, or on local
  # environment use /oauth/cognito/authorize
  def login
    redirect_to oauth_cognito_authorize_path
  end
end
