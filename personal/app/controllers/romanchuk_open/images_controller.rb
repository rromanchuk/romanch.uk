module RomanchukOpen
  class ImagesController < RomanchukOpen::ApplicationController
    before_action :set_breadcrumbs

    let(:tournament) { Tournament.friendly.find params[:tournament_id] }
    let(:image) { Image.friendly.find params[:id] }

    def show
      add_breadcrumb(tournament.title, romanchuk_open_tournament_path(tournament))
      add_breadcrumb(image.title)
    end
    

    private


    def set_breadcrumbs
      add_breadcrumb("All years", romanchuk_open_tournaments_path)
    end
  end
end
