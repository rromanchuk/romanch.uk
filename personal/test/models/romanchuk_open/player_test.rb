require "test_helper"

module RomanchukOpen
  class PlayerTest < ActiveSupport::TestCase
    test "sanity" do
      assert_nothing_raised { 
        romanchuk_open_players(:ryan)
      }
    end
  end
end
