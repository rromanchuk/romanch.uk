ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'action_policy/test_helper'
# require 'mocha/minitest'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  # Add more helper methods to be used by all tests here...
end

module SignInHelper
  def sign_in_as(user)
    
    post session_url, params: { session: { email_address: user.email_address, password: 'password' } }
  end
end

module DebugHelper
  def debug_response!
    JSON.parse(response.body).tap do |json|
      puts json
    end
  end
end

class ActionDispatch::IntegrationTest
  include SignInHelper
  include DebugHelper
end
