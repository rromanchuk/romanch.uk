module Serve
  class ImagesController < ApplicationController

    let(:image) { Asset.friendly.find(params[:id]) }

    def show; end
  end
end