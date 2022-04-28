module Serve
  class VideosController < ApplicationController
    layout 'fluid'
    
    let(:video) do 
      if (key = params[:key].presence)
        Video.find_by_key(key)
      else
        Video.friendly.find(params[:id])
      end
    end
    
    def show; end
  end
end