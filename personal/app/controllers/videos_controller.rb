class VideosController < ApplicationController
  before_action :require_user!
  
  let(:videos) { Video.all }
  let(:video) { Video.friendly.find(params[:id]) }
  
  def new
    @video = Video.new
  end
  
  def destroy
    video.destroy
    redirect_to videos_path, status: 303
  end

  def update
    video.update!(video_params)
    redirect_to videos_path, status: 303
  end

  def create
    @video = Video.new(video_params)

    if video.save
      redirect_to videos_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def edit; end
  def index; end

  private
  
  def video_params
    params.require(:video).permit(:key, :title, :description, :tags_as_string)
  end
end
