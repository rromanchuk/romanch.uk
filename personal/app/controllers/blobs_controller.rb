class BlobsController < ApplicationController
  
  let(:blobs) { Blob.all }
  let(:blob) { Blob.friendly.find(params[:id]) }
  
  def new
    @blobs = Blobs.new
    authorize! blob
  end

  def destroy
    authorize! blob
    blobs.destroy
    redirect_to blobs_path, status: 303
  end

  def edit
    
  end

  def update
    authorize! blobs
    blobs.update!(blob_params)
    redirect_to blobs_path, status: 303
  end

  def create
    @blobs = Blob.new(blob_params)
    authorize! blob

    if blobs.save
      redirect_to blobs_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def index
    require_me!
  end

  private
  
  def blob_params
    params.require(:blob).permit(:key, :title, :description, :tags_as_string, :slug)
  end
end
