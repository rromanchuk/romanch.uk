require 'test_helper'
module RyanRomanchuk
  class PostTest < ActiveSupport::TestCase
    test 'sanity' do
      assert_nothing_raised do
        ryan_romanchuk_posts(:one)
      end
    end
  end
end