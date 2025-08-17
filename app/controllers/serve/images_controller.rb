module Serve
  class ImagesController < ApplicationController
    before_action :set_breadcrumbs
    allow_unauthenticated_access
    let(:image) { Blob.friendly.find(params[:id]) }
    let(:attachment) { image.attachments.first }

    def show
      add_breadcrumb("Images")
      add_breadcrumb(image.title)
      render stream: true
    end
  end
end