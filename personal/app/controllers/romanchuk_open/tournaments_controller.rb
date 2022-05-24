module RomanchukOpen
  class TournamentsController < RomanchukOpen::ApplicationController
    before_action :set_breadcrumbs

    let(:tournament) { Tournament.friendly.find params[:id] }
    let(:tournaments) { Tournament.oldest(:ocurred_on) }
    def new
      @tournament = Tournament.new
    end

    def create
      require_me!
      @tournament = Tournament.new(tournament_params)
      if tournament.save
        redirect_to romanchuk_open_tournaments_path
      else
        render :new, status: :unprocessable_entity
      end
    end

    def destroy
      require_me!
      tournament.destroy
      redirect_to romanchuk_open_tournaments_path, status: 303
    end

    def update
      require_me!
      tournament.update(tournament_params)
      redirect_to romanchuk_open_tournament_path(tournament), status: 303
    end

    def show
      add_breadcrumb(tournament.title)
    end
    
    def players
      add_breadcrumb(tournament.title, romanchuk_open_tournament_path(tournament))
      add_breadcrumb("Participants")
    end

    private

    def tournament_params
      params.require(:romanchuk_open_tournament).permit(:title, :ocurred_on, :city, :country, :slug)
    end

    def set_breadcrumbs
      add_breadcrumb("Tournaments", romanchuk_open_tournaments_path)
    end
  end
end
