require 'test_helper'

module Wx
  class PirepTest < ActiveSupport::TestCase
    test 'sanity' do
      assert_nothing_raised do
        wx_pireps(:ua)
      end
    end
  end
end
