class AssetsController < ApplicationController
  
  let(:assets) { Asset.all }
  let(:asset) { Asset.friendly.find(params[:id]) }
  
  def new
    @asset = Asset.new
    authorize! asset
  end

  def destroy
    authorize! asset
    asset.destroy
    redirect_to assets_path, status: 303
  end

  def edit
    
  end

  def update
    authorize! asset
    asset.update!(asset_params)
    redirect_to assets_path, status: 303
  end

  def create
    @asset = Asset.new(asset_params)
    authorize! image

    if asset.save
      redirect_to assets_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def index; end

  private
  
  def asset_params
    params.require(:asset).permit(:key, :title, :description, :tags_as_string, :slug)
  end
end
