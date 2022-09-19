class AttachmentsController < ApplicationController
  before_action :require_user!
  let(:dr_pagy)
  let(:attachments) do
    relation = apply_filter
    @dr_pagy, _attachments = pagy(relation, items: 25)
    _attachments
  end

  let(:attachment) { Attachment.find(params[:id]) }

  def new
    @attachment = Attachment.new
  end

  def create
    @attachment = Attachment.new(attachment_params)
    if attachment.update(attachment_params)
      redirect_to attachment_url(attachment), notice: 'Raw report was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def update
    if attachment.update(attachment_params)
      redirect_to attachment_url(attachment), notice: 'Raw report was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def apply_filter(relation=Attachment.all)
    relation.recent
  end

  def attachment_params
    params.require(:attachment).permit(:name, :record_id, :record_type, :blob_id)
  end
end
