class ImagesController < ApplicationController
  
  let(:images) { Image.all }
  let(:image) { Image.friendly.find(params[:id]) }
  
  def new
    @image = Image.new
    authorize! image
  end

  def destroy
    authorize! image
    image.destroy
    redirect_to images_path, status: 303
  end

  def update
    authorize! image
    image.update!(image_params)
    redirect_to images_path, status: 303
  end

  def create
    @image = Image.new(image_params)
    authorize! image

    if image.save
      redirect_to images_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def index; end

  private
  
  def image_params
    params.require(:image).permit(:key, :title, :caption, :tags_as_string, :slug, :imageable_id, :imageable_type)
  end
end
