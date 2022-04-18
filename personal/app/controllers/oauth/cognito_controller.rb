module Oauth
  class CognitoController < ApplicationController
    include CognitoTokenVerifier::ControllerMacros
    
    def authorize

    end

    def handle_expired_token(exception)
      puts exception.message
    end
  
    def handle_invalid_token(exception)
      puts exception.message
    end
  end
end