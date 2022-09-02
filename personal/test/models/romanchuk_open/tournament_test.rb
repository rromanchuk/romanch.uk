require "test_helper"

class RomanchukOpen::TournamentTest < ActiveSupport::TestCase
  test "the truth" do
    romanchuk_open_tournaments(:fourth_annual)
    
    assert true
  end
end
