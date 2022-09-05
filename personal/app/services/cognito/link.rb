module Cognito
  # https://docs.aws.amazon.com/sdk-for-ruby/v3/api/Aws/CognitoIdentityProvider/Client.html#admin_link_provider_for_user-instance_method
  class Link < Base
    let(:params) do
      {
        user_pool_id: Credentials[:cognito_user_pool], # required
        destination_user: { # required
          provider_name: 'Cognito',
          provider_attribute_value: username
        },
        source_user: { # required
          provider_name: 'SignInWithApple',
          provider_attribute_name: 'Cognito_Subject',
          provider_attribute_value: federated_id
        }
      }
    end

    attr_reader :username, :federated_id

    def initialize(cognito_username, federated_id)
      super()
      @username = cognito_username
      @federated_id = federated_id
    end

    def call
      client.admin_link_provider_for_user(params)
    end
  end
end
