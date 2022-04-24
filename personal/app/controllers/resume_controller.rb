
class ResumeController < ApplicationController
  layout 'resume'
  let(:source) { File.open(File.join(Rails.root, 'app', 'views', 'resume', 'source.tex')).read }
  let(:pdf) { File.open(File.join(Rails.root, 'app', 'assets', 'no_digesting', 'romanchuk.pdf')).read }
  
  def index; end

end