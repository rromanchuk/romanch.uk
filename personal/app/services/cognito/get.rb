module Cognito
  class Get < Base
    def self.me
      call('ryan')
    end

    attr_reader :username
    def initialize(username)
      super()
      @username = username
    end

    def call
      client.admin_get_user({
        user_pool_id: Credentials[:cognito_user_pool], # required
        username: username # required
      })
    end
  end
end