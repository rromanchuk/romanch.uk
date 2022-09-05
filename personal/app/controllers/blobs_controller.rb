class BlobsController < ApplicationController
  before_action :require_user!
  let(:blobs) { Blob.all }
  let(:blob) { Blob.friendly.find(params[:id]) }

  def new
    @blob = Blob.new
  end

  def destroy
    blobs.destroy
    redirect_to blobs_path, status: 303
  end

  def edit; end

  def update
    blob.update!(blob_params)
    redirect_to blobs_path, status: 303
  end

  def create
    @blob = Blob.new(blob_params)

    authorize! blob

    if blob.save
      redirect_to blobs_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index; end

  private

  def blob_params
    params.require(:blob).permit(:key, :title, :description, :tags_as_string, :slug, :content_type)
  end
end
