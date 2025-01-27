module Ro
  class ImagesController < ApplicationController
    let(:dr_pagy)
    let(:image) { Image.friendly.find params[:id] }
    let(:images) do 
      relation = Image.recent
      @dr_pagy, records = pagy(relation, items: 25)
      records
    end
    
    def index
    end

    def new
      @image = Image.new
    end

    def create
      @image = Image.new(image_params)
      if image.save
        redirect_to request.referer, status: :see_other
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      image.update!(image_params)
      redirect_to request.referer, status: :see_other
    end

    def destroy
      image.destroy
      redirect_to  ro_images_path, status: :see_other
    end
    
    private
    def image_params
      params.require(:ro_image).permit(:file, :tournament_id, :title, :caption, :tags_as_string, :slug)
    end
    
  end
end
