require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test 'sanity' do
    assert_nothing_raised do
      posts(:one)
    end
  end
end
