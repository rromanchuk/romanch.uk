module Serve
  class VideosController < ApplicationController
    layout 'fluid'
    
    let(:video) { Video.friendly.find(params[:id]) }
    
    def show; end
  end
end