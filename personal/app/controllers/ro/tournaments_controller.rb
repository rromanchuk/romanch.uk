module Ro
  class TournamentsController < ApplicationController
    allow_unauthenticated_access only: %i[ show index newsletter ]
    before_action :set_breadcrumbs

    let(:tournament) { Tournament.friendly.find params[:id] }
    let(:tournaments) { Tournament.oldest(:ocurred_on) }
    
    def new
      @tournament = Tournament.new
      authorize! tournament
    end

    def edit
      
    end

    def create
      @tournament = Tournament.new(tournament_params)
      authorize! tournament
      if tournament.save
        redirect_to request.referer, status: :see_other
      else
        render :new, status: :unprocessable_entity
      end
    end

    def destroy
      authorize! tournament
      tournament.destroy
      redirect_to request.referer, status: :see_other
    end

    def update
      authorize! tournament
      tournament.update(tournament_params)
      redirect_to request.referer, status: :see_other
    end

    def show
      add_breadcrumb(tournament.title)
      fresh_when last_modified: tournament.updated_at.utc, etag: tournament
    end

    # def players
    #   add_breadcrumb(tournament.title, romanchuk_open_tournament_path(tournament))
    #   add_breadcrumb("Participants")
    # end

    def newsletter
      add_breadcrumb(tournament.title, ro_tournament_url(tournament))
      add_breadcrumb('Newsletter')
    end

    private

    def tournament_params
      params.require(:ro_tournament).permit(:title, :ocurred_on, :city, :country, :location,
                                                        :poster, :newsletter, image_ids: [], player_ids: [])
    end

    
  end
end
