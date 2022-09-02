require "test_helper"

class RomanchukOpen::TournamentTest < ActiveSupport::TestCase
  test "sanity" do
    assert_nothing_raised { 
      romanchuk_open_tournaments(:fourth_annual)
    }
  end
end
