module RomanchukOpen
  class ImagesController < RomanchukOpen::ApplicationController
    before_action :set_breadcrumbs

    let(:tournament) { Tournament.friendly.find params[:tournament_id] }
    let(:image) { Image.friendly.find params[:id] }

    def show
      add_breadcrumb(tournament.title, romanchuk_open_tournament_url(tournament))
      add_breadcrumb(image.title)
    end

    private

    def set_breadcrumbs
      add_breadcrumb('Home', romanchuk_open_tournaments_url)
    end
  end
end
