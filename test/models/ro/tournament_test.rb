require "test_helper"
module Ro
  class TournamentTest < ActiveSupport::TestCase
    test "sanity" do
      assert_nothing_raised { 
        ro_tournaments(:fourth_annual)
      }
    end
  end
end