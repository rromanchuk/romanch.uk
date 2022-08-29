module Serve
  class AssetsController < ApplicationController

    let(:asset) { Asset.friendly.find(params[:id]) }

    def show; end
  end
end