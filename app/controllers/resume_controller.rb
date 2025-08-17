class ResumeController < ApplicationController
  let(:source) { File.open(File.join(Rails.root, 'app', 'views', 'resume', 'source.tex')).read }
  def index; end

  def download
    authorize!
    redirect_to 'https://romanch.uk/static/ryan_romanchuk_noATS.pdf', allow_other_host: true
  end

  def implicit_authorization_target
    :resume
  end
end
