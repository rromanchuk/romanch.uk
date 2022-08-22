module RomanchukOpen
  class GolfersController < RomanchukOpen::ApplicationController
    before_action :set_breadcrumbs
    let(:golfer) { Golfer.find params[:id] }
    let(:tournament) { Tournament.friendly.find params[:tournament_id] }
    
    let(:golfers) do
      if params[:tournament_id]
        
        tournament.golfers
      else
        Golfer.all
      end
    end

    def show
      add_breadcrumb(golfer.tournament.title, romanchuk_open_tournament_path(golfer.tournament))
      add_breadcrumb(golfer.name, romanchuk_open_player_path(golfer.player))
    end

    def new
      add_breadcrumb("Create golfer")
      @golfer = Golfer.new
    end

    def create
      @golfer = Golfer.new(golfer_params)

      if golfer.save
        redirect_to romanchuk_open_golfers_path
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      golfer.update(golfer_params)
      redirect_to romanchuk_open_golfer_path(golfer), status: 303
    end

    def destroy
      golfer.destroy
      redirect_to romanchuk_open_golfers_path, status: 303
    end

    private
    def golfer_params
      params.require(:romanchuk_open_golfer).permit(:player_id, :tournament_id)
    end

    def set_breadcrumbs
      add_breadcrumb("All years", romanchuk_open_tournaments_path)
      if params[:tournament_id]
        add_breadcrumb(tournament.title, romanchuk_open_tournament_path(tournament))
      end

      add_breadcrumb("All golfers")
    end
  end
end