require 'test_helper'

module Wx
  class BatchTest < ActiveSupport::TestCase
    test 'sanity' do
      assert_nothing_raised do
        wx_batches(:first)
      end
    end
  end
end
