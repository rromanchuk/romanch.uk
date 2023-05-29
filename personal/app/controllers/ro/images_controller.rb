module Ro
  class ImagesController < ApplicationController
    let(:dr_pagy)
    let(:image) { Image.friendly.find params[:id] }
    let(:images) do 
      relation = Image.recent
      @dr_pagy, records = pagy(relation, items: 25)
      records
    end
    
    def new
      @image = Image.new
    end

    def create
      @image = Image.create!(image_params)
      redirect_to request.referer, status: :see_other
    end

    def update
      image.update!(image_params)
      redirect_to request.referer, status: :see_other
    end

    def image_params
      params.require(:ro_image).permit(:file, :tournament_id, :title, :caption, :tags_as_string, :slug)
    end
    
  end
end
