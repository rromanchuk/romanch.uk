module Serve
  class VideosController < ApplicationController
    before_action :set_breadcrumbs

    let(:video) { Blob.friendly.find(params[:id]) }

    def show
      add_breadcrumb("Flying Videos", page_url("flying"))
      add_breadcrumb(video.title)
    end

    private

  end
end
