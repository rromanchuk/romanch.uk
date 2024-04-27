module Ro
  class GolfersController < ApplicationController
    let(:tournament) { Tournament.friendly.find params[:tournament_id] }
    let(:golfers) do
      if params[:tournament_id]
        tournament.golfers
      else
        Golfer.recent
      end
    end
    let(:golfer)

    def new
      @golfer = Golfer.new
    end

    def create
      @golfer = Golfer.create!(golfer_params)
    end

    def golfer_params
      params.require(:ro_golfer).permit(:player_id, :tournament_id)
    end
  end
end