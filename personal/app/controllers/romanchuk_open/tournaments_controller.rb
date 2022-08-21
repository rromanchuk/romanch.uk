module RomanchukOpen
  class TournamentsController < RomanchukOpen::ApplicationController
    before_action :set_breadcrumbs

    let(:tournament) { Tournament.friendly.find params[:id] }
    let(:tournaments) { Tournament.oldest(:ocurred_on) }
    def new
      @tournament = Tournament.new
      authorize! tournament
    end

    def create
      @tournament = Tournament.new(tournament_params)
      authorize! tournament
      if tournament.save
        redirect_to romanchuk_open_tournaments_path
      else
        render :new, status: :unprocessable_entity
      end
    end

    def destroy
      authorize! tournament
      tournament.destroy
      redirect_to romanchuk_open_tournaments_path, status: 303
    end

    def update
      authorize! tournament
      tournament.update(tournament_params)
      redirect_to romanchuk_open_tournament_path(tournament), status: 303
    end

    def show
      add_breadcrumb(tournament.title)
    end
    
    # def players
    #   add_breadcrumb(tournament.title, romanchuk_open_tournament_path(tournament))
    #   add_breadcrumb("Participants")
    # end

    def newsletter
      add_breadcrumb(tournament.title, romanchuk_open_tournament_path(tournament))
      add_breadcrumb("Newsletter")
    end

    private

    def tournament_params
      params.require(:romanchuk_open_tournament).permit(:title, :ocurred_on, :city, :country, :location, :newsletter)
    end

    def set_breadcrumbs
      add_breadcrumb("All years", romanchuk_open_tournaments_path)
    end
  end
end
