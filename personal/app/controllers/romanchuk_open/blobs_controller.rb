module RomanchukOpen
  class BlobsController < RomanchukOpen::ApplicationController
    before_action :set_breadcrumbs

    let(:tournament) { Tournament.friendly.find params[:tournament_id] }
    let(:blob) { Blob.friendly.find params[:id] }

    def show
      add_breadcrumb(tournament.title, romanchuk_open_tournament_url(tournament))
      add_breadcrumb(blob.title)
      render stream: true
    end

  end
end
