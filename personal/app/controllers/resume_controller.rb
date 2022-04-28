class ResumeController < ApplicationController
  before_action :turbo_frame_request_variant
  layout 'fluid'

  let(:source) { File.open(File.join(Rails.root, 'app', 'views', 'resume', 'source.tex')).read }



  def index; end

  def video; end

  def turbo_frame_request_variant
    request.variant = :turbo_frame if turbo_frame_request?
  end
end
