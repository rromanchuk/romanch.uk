require 'test_helper'

module Tds
  class MetarTest < ActiveSupport::TestCase
    test 'sanity' do
      assert_nothing_raised do
        tds_metars(:kmfv)
      end
    end
  end
end
