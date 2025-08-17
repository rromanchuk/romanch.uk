require "test_helper"

module Ro
  class PlayerTest < ActiveSupport::TestCase
    test "sanity" do
      assert_nothing_raised { 
        ro_players(:ryan)
      }
    end
  end
end
