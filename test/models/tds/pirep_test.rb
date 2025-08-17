require 'test_helper'

module Tds
  class PirepTest < ActiveSupport::TestCase
    test 'sanity' do
      assert_nothing_raised do
        tds_pireps(:ua)
      end
    end
  end
end
