# frozen_string_literal: true

module Oauth
  class CognitoController < ApplicationController

    let(:client) do
      OAuth2::Client.new(
        Credentials[:cognito_client],
        Credentials[:cognito_client_secret], 
        site: Credentials[:cognito_hosted_authorize_url],
        authorize_url: "/login",
        token_url: "/oauth2/token"
      ) 
    end

    def authorize
      redirect_to client.auth_code.authorize_url(redirect_uri: Credentials[:cognito_token_callback]), allow_other_host: true
    end

    def token
      begin
        token = client.auth_code.get_token(params[:code], redirect_uri: Credentials[:cognito_token_callback])
        user = token.get('/oauth2/userInfo').parsed
        User.find_or_create_by!(cognito_id: user['sub']).tap do |_user|
          _user.update!(username: user['username'], email: user['email'])
          set_current_user(_user)
        end
      rescue OAuth2::Error => e
        ap e
      end
      redirect_to root_path
    end
  end
end