class SessionsController < ApplicationController
  before_action :require_user!, except: %i[apple_signin client]

  def logout
    logout!
    redirect_to root_path, notice: 'You have been logged out.'
  end

  def apple_signin; end

  def client; end
  def account; end

  # Virtual path for ALB cognito authentication on the ALB listener. The url
  # path of /login with will require valid session and redirect to hosted
  # cognito UI. If you want to forece non-alb terminated oauth, or on local
  # environment use /oauth/cognito/authorize
  def login
    redirect_to root_path
  end
end
