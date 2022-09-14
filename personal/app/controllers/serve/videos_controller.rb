module Serve
  class VideosController < ApplicationController
    before_action :set_breadcrumbs

    let(:video) { Blob.friendly.find(params[:id]) }

    def show
      add_breadcrumb(video.title)
      fresh_when last_modified: video.updated_at.utc, etag: video
    end

    private

    def set_breadcrumbs
      add_breadcrumb('Home', root_url)
    end
  end
end
