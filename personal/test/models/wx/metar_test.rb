require 'test_helper'

module Wx
  class MetarTest < ActiveSupport::TestCase
    test 'sanity' do
      assert_nothing_raised do
        wx_metars(:kmfv)
      end
    end
  end
end
