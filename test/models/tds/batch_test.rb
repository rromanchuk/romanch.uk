require 'test_helper'

module Tds
  class BatchTest < ActiveSupport::TestCase
    test 'sanity' do
      assert_nothing_raised do
        tds_batches(:first)
      end
    end
  end
end
