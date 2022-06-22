class ResumeController < ApplicationController
  
  let(:source) { File.open(File.join(Rails.root, 'app', 'views', 'resume', 'source.tex')).read }
  def index
  end
  
  def download
    authorize!
    redirect_to 'https://romanch.uk/static/docs/06212022/romanchuk.pdf', allow_other_host: true
  end

  def turbo_frame_request_variant
    request.variant = :turbo_frame if turbo_frame_request?
  end

  def implicit_authorization_target
    :resume
  end
end
