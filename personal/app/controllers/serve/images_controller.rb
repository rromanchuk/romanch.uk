module Serve
  class ImagesController < ApplicationController

    let(:image) { Image.friendly.find(params[:id]) }

    def show; end
  end
end