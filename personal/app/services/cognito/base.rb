module Cognito
  class Base < Service
    let(:client) { ::Aws::CognitoIdentityProvider::Client.new }  

  end
end