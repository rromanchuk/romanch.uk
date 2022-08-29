module Serve
  class ImagesController < ApplicationController

    let(:image) { Blob.friendly.find(params[:id]) }

    def show; end
  end
end