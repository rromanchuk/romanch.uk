class SessionsController < ApplicationController
  def logout
    cookies.delete 'AWSELBAuthSessionCookie-0'
    reset_session
    redirect_to "#{config.auth_url}?client_id=#{Credentials[:cognito_client]}", allow_other_host: true
  end
end