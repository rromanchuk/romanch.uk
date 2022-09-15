module RomanchukOpen
  class TournamentsController < RomanchukOpen::ApplicationController
    before_action :set_breadcrumbs

    let(:tournament) { Tournament.friendly.find params[:id] }
    let(:tournaments) { Tournament.oldest(:ocurred_on) }
    def new
      require_me!
      @tournament = Tournament.new
      authorize! tournament
    end

    def edit
      require_me!
      tournament.ro_photo_blobs.build
    end

    def create
      require_me!
      @tournament = Tournament.new(tournament_params)
      authorize! tournament
      if tournament.save
        redirect_to romanchuk_open_tournaments_path
      else
        render :new, status: :unprocessable_entity
      end
    end

    def destroy
      require_me!
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
      fresh_when last_modified: tournament.updated_at.utc, etag: tournament
      render stream: true
    end

    # def players
    #   add_breadcrumb(tournament.title, romanchuk_open_tournament_path(tournament))
    #   add_breadcrumb("Participants")
    # end

    def newsletter
      add_breadcrumb(tournament.title, romanchuk_open_tournament_url(tournament))
      add_breadcrumb('Newsletter')
    end

    private

    def tournament_params
      params.require(:romanchuk_open_tournament).permit(:title, :ocurred_on, :city, :country, :location, :newsletter,
                                                        ro_photo_blobs_attributes: %i[id title description key content_type])
    end

    
  end
end
