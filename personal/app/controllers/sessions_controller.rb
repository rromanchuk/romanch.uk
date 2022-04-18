class SessionsController < ApplicationController
  def logout
    cookies.delete '_alb_personal'
    reset_session
    redirect_to "#{config.auth_url}?client_id=#{Credentials[:cognito_client]}", allow_other_host: true
  end

  def login
    #"https://<your_domain>/login?response_type=code&client_id=<your_app_client_id>&redirect_uri=<your_callback_url>"
  end
end