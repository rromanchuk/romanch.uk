module RomanchukOpen
  class TournamentsController < RomanchukOpen::ApplicationController
    let(:tournament) { Tournament.friendly.find params[:id] }
    let(:tournaments) { Tournament.all }
    def new
      @tournament = Tournament.new
    end

    def create
      @tournament = Tournament.new(tournament_params)
      if tournament.save
        redirect_to romanchuk_open_tournaments_path
      else
        render :new, status: :unprocessable_entity
      end
    end

    def destroy
      tournament.destroy
      redirect_to romanchuk_open_tournaments_path, status: 303
    end

    def update
      tournament.update(tournament_params)
      redirect_to romanchuk_open_tournament_path(tournament), status: 303
    end

    private

    def tournament_params
      params.require(:romanchuk_open_tournament).permit(:title, :ocurred_on, :city, :country, :slug)
    end
  end
end
