module RomanchukOpen
  class PlayersController < RomanchukOpen::ApplicationController
    before_action :set_breadcrumbs
    let(:player) { Player.friendly.find params[:id] }
    let(:players) { Player.all }

    def show
      add_breadcrumb(player.name)
    end

    def new
      add_breadcrumb("Create player")
      @player = Player.new
    end

    def create
      @player = Player.new(player_params)

      if player.save
        redirect_to romanchuk_open_players_path
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      player.update(player_params)
      redirect_to romanchuk_open_player_path(player), status: 303
    end

    def destroy
      player.destroy
      redirect_to romanchuk_open_players_path, status: 303
    end

    def player_params
      params.require(:romanchuk_open_player).permit(:name)
    end

    def set_breadcrumbs
      add_breadcrumb("All players")
    end
  end
end