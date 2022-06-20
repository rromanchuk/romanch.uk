class ResumeController < ApplicationController
  
  # layout 'fluid'

  let(:source) { File.open(File.join(Rails.root, 'app', 'views', 'resume', 'source.tex')).read }
  def index
    flash[:notice] = "You can click on things"
  end
  
  def download
    authorize!
    redirect_to 'https://romanch.uk/static/docs/v5/romanchuk_public.pdf', allow_other_host: true
  end

  def turbo_frame_request_variant
    request.variant = :turbo_frame if turbo_frame_request?
  end

  def implicit_authorization_target
    :resume
  end
end
