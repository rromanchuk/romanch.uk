module Serve
  class ImagesController < ApplicationController
    layout 'fluid'
    let(:image) { Image.friendly.find(params[:id]) }

    def show; end
  end
end