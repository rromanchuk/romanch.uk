ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'action_policy/test_helper'
require 'mocha/minitest'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  
  # Add more helper methods to be used by all tests here...
end

module SignInHelper
  def sign_in_as(user)
    ValidateUserClaims.expects(:call).returns(true)
    get login_url, headers: { 'x-amzn-oidc-identity': user.cognito_id, 'x-amzn-oidc-data': 'fakedata' }
  end
end

class ActionDispatch::IntegrationTest
  include SignInHelper
end
