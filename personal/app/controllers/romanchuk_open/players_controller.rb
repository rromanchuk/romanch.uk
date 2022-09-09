module RomanchukOpen
  class PlayersController < RomanchukOpen::ApplicationController
    before_action :set_breadcrumbs
    let(:player) { Player.friendly.find params[:id] }
    let(:players) { Player.all }

    def show
      add_breadcrumb(player.name)
    end

    def new
      require_me!
      add_breadcrumb('Create player')
      @player = Player.new
    end

    def create
      require_me!
      @player = Player.new(player_params)

      if player.save
        redirect_to romanchuk_open_players_path
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      require_me!
      player.update(player_params)
      redirect_to romanchuk_open_player_path(player), status: 303
    end

    def destroy
      require_me!
      player.destroy
      redirect_to romanchuk_open_players_path, status: 303
    end

    def player_params
      params.require(:romanchuk_open_player).permit(:name)
    end

    private

    def set_breadcrumbs
      add_breadcrumb('Home', romanchuk_open_tournaments_path)
      add_breadcrumb('Players', romanchuk_open_players_path)
    end

    def ensure_frame_response
      return unless Rails.env.development?

      redirect_to root_path unless turbo_frame_request?
    end
  end
end
