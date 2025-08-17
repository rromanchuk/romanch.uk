require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'sanity' do
    assert_nothing_raised do
      ryan_romanchuk_users(:ryan)
    end
  end
end
