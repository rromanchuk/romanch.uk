class ResumeController < ApplicationController
  before_action :turbo_frame_request_variant
  layout 'fluid'

  let(:source) { File.open(File.join(Rails.root, 'app', 'views', 'resume', 'source.tex')).read }
  let(:pdf) { File.open(File.join(Rails.root, 'app', 'assets', 'documents', 'romanchuk.pdf')).read }
  let(:video_key) do
    case params[:key].to_sym
    when :l35
      'l35/master.m3u8'
    end
  end

  def index; end

  def video; end

  def turbo_frame_request_variant
    request.variant = :turbo_frame if turbo_frame_request?
  end
end
