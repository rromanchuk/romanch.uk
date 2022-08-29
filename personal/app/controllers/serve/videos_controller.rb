module Serve
  class VideosController < ApplicationController

    
    let(:video) { Blob.friendly.find(params[:id]) }
    
    def show; end
  end
end