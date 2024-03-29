# frozen_string_literal: true

module Oauth
  # A reachable route for  Cognito authentication (traditional) flow. This url path
  # should not trigger an ALB listener
  class CognitoController < ApplicationController
    # Two similar authorization endpoints, /login takes you to hosted cognito UI, /oauth2/token allows additional params
    # https://docs.aws.amazon.com/cognito/latest/developerguide/authorization-endpoint.html
    # https://docs.aws.amazon.com/cognito/latest/developerguide/login-endpoint.html
    let(:client) do
      OAuth2::Client.new(
        Credentials[:cognito_client],
        Credentials[:cognito_client_secret],
        site: Credentials[:cognito_hosted_authorize_url],
        authorize_url: '/oauth2/authorize',
        token_url: '/oauth2/token'
      )
    end

    def authorize_apple
      redirect_to client.auth_code.authorize_url(redirect_uri: oauth_cognito_token_url, identity_provider: 'SignInWithApple'),
                  allow_other_host: true
    end

    def logout
      redirect_to client.connection.build_url('/logout', { logout_uri: logout_url, client_id: Credentials[:cognito_client] }).to_s,
                  allow_other_host: true
    end

    def authorize
      redirect_to client.auth_code.authorize_url(redirect_uri: oauth_cognito_token_url), allow_other_host: true
    end

    def token
      token = client.auth_code.get_token(params[:code], redirect_uri: oauth_cognito_token_url)
      user = token.get('/oauth2/userInfo').parsed
      RyanRomanchuk::User.find_or_create_by!(cognito_id: user['sub']).tap do |_user|
        # _user.update!(username: user['username'], email: user['email'])
        _user.update!(username: user['username'])
        set_current_user(_user)
      end
      original_request = session.delete(:original_request)
      redirect_to original_request || root_path, notice: 'Success.'
    rescue OAuth2::Error => e
      Sentry.capture_exception(e)
      redirect_to root_path, notice: "Failed: #{e.message}"
    end
  end
end
