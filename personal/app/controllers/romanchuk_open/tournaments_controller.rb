module RomanchukOpen
  class TournamentsController < RomanchukOpen::ApplicationController
    let(:tournament) { Tournament.friendly.find params[:id] }
    let(:tournaments) { Tournament.all }
    def new
      @tournament = Tournament.new
    end

    def create
      @tournament = Tournament.create!(tournament_params)
      redirect_to tournament
    end

    def destroy
      tournament.destroy
    end

    def update
      tournament.update(tournament_params)
    end

    private

    def tournament_params
      params.require(:romanchuk_open_tournament).permit(:title, :ocurred_on, :city, :country)
    end
  end
end