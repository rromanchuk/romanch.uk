module Ro
  class PlayersController < ApplicationController
    before_action :set_breadcrumbs
    let(:player) { Player.friendly.find params[:id] }
    let(:players) { Player.all }

    def show
      add_breadcrumb('Players', ro_players_url)
      add_breadcrumb(player.name)
    end

    def index
      add_breadcrumb('Players')
    end

    def new
      require_me!
      add_breadcrumb('Players', ro_players_url)
      add_breadcrumb('Create player')
      @player = Player.new
    end

    def create
      require_me!
      @player = Player.new(player_params)

      if player.save
        redirect_to request.referer, status: :see_other
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      require_me!
      player.update(player_params)
      redirect_to request.referer, status: :see_other
    end

    def destroy
      require_me!
      player.destroy
      redirect_to request.referer, status: :see_other
    end

    def player_params
      params.require(:ro_player).permit(:name, :slug, :avatar)
    end

  end
end
