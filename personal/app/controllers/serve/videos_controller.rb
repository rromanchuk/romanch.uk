module Serve
  class VideosController < ApplicationController

    
    let(:video) { Video.friendly.find(params[:id]) }
    
    def show; end
  end
end