module RyanRomanchuk
  class StreamingVideosController < ApplicationController
    before_action :set_breadcrumbs

    let(:dr_pagy)
    let(:streaming_videos) do
      relation = apply_filter
      @dr_pagy, _streaming_videos = pagy(relation, items: 25)
      _streaming_videos
    end
    let(:streaming_video) { StreamingVideo.friendly.find(params[:id]) }

    def new
      @streaming_video = StreamingVideo.new
      authorize! streaming_video
      add_breadcrumb('Streaming Videos', streaming_videos_url)
      add_breadcrumb('New')
    end

    def destroy
      authorize! streaming_video
      if streaming_video.destroy

      end
      redirect_to streaming_videos_path, status: 303
    end

    def edit
      authorize! streaming_video
      add_breadcrumb('Streaming Videos', streaming_videos_url)
      add_breadcrumb(streaming_video.title, streaming_video_url(streaming_video))
      add_breadcrumb('Edit')
    end

    def update
      if streaming_video.update(streaming_video_params)
        redirect_to streaming_video_url(blob), notice: 'Streaming video was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def create
      @streaming_video = StreamingVideo.new(streaming_video_params)

      authorize! streaming_video

      if streaming_video.save
        redirect_to streaming_videos_path
      else
        render :new, status: :unprocessable_entity
      end
    end

    def index; end

    private

    def apply_filter(relation = StreamingVideo.all)
      relation.recent
    end

    def streaming_video_params
      params.require(:ryan_romanchuk_streaming_video).permit(:key, :title, :description, :tags_as_string, :slug, :content_type, :thumbnail_key)
    end
  end
end