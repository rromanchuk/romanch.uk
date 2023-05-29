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
      require_me!
    end

    def new
      require_me!
      @image = Image.new
    end

    def create
      require_me!
      @image = Image.create!(image_params)
      redirect_to request.referer, status: :see_other
    end

    def update
      require_me!
      image.update!(image_params)
      redirect_to request.referer, status: :see_other
    end

    def destroy
      require_me!
      image.destroy
      redirect_to  ro_images_path, status: :see_other
    end
    
    private
    def image_params
      params.require(:ro_image).permit(:file, :tournament_id, :title, :caption, :tags_as_string, :slug)
    end
    
  end
end
