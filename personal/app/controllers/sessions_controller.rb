class SessionsController < ApplicationController
  
  def logout
    logout!
    redirect_to "#{config.auth_url}?client_id=#{Credentials[:cognito_client]}", allow_other_host: true
  end

  def login
    if Rails.env.development?
      session[:amzn_oidc_identity] = '54467d4a-f7bc-457d-aa72-55842106b02e'
    end

    require_user!
    redirect_to root_path
  end
end