class ResumeController < ApplicationController
  
  layout 'fluid'

  let(:source) { File.open(File.join(Rails.root, 'app', 'views', 'resume', 'source.tex')).read }
  def index; end

  def turbo_frame_request_variant
    request.variant = :turbo_frame if turbo_frame_request?
  end
end
