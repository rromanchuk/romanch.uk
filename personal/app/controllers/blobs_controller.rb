class BlobsController < ApplicationController
  before_action :set_breadcrumbs
  
  let(:dr_pagy)
  let(:blobs) do
    relation = apply_filter
    @dr_pagy, _blobs = pagy(relation, items: 25)
    _blobs
  end
  let(:blob) { Blob.friendly.find(params[:id]) }

  def new
    @blob = Blob.new
    authorize! blob
    add_breadcrumb('Blobs', blobs_url)
    add_breadcrumb('New')
  end

  def destroy
    authorize! blob
    if blob.destroy

    end
    redirect_to blobs_path, status: 303
  end

  def edit
    authorize! blob
    add_breadcrumb('Blobs', blobs_url)
    add_breadcrumb(blob.title, blob_url(blob))
    add_breadcrumb('Edit')
  end

  def update
    if blob.update(blob_params)
      redirect_to blob_url(blob), notice: 'Blob was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
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

  def apply_filter(relation=Blob.all)
    relation.recent
  end

  def blob_params
    params.require(:blob).permit(:key, :title, :description, :tags_as_string, :slug, :content_type)
  end
end
