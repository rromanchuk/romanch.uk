module Oauth
  class CognitoController < ApplicationController
    include CognitoTokenVerifier::ControllerMacros
    
    def authorize

    end

    def handle_expired_token(exception)
      rase exception
    end
  
    def handle_invalid_token(exception)
      rase exception
    end
  end
end