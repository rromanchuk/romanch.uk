class ImagesController < ApplicationController
  before_action :require_user!
  
  let(:images) { Image.all }
  let(:image) { Image.friendly.find(params[:id]) }
  
  def new
    @image = Image.new
  end

  def destroy
    image.destroy
    redirect_to images_path, status: 303
  end

  def update
    image.update!(image_params)
    redirect_to images_path, status: 303
  end

  def create
    @image = Image.new(image_params)

    if image.save
      redirect_to images_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def index; end

  private
  
  def image_params
    params.require(:image).permit(:key, :title, :caption, :tags_as_string)
  end
end
