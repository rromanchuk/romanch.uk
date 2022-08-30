module Serve
  class VideosController < ApplicationController

    
    let(:video) { Blob.friendly.find(params[:id]) }
    
    def show
      fresh_when last_modified: video.updated_at.utc, etag: video
    end
  end
end