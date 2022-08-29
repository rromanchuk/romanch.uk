module Serve
  class VideosController < ApplicationController

    
    let(:video) { Asset.friendly.find(params[:id]) }
    
    def show; end
  end
end