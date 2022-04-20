
class HomeController < ApplicationController
  def status
    head :ok
  end
  
  def index; end
  def editor; end

  def resume
    @pdf = File.open(File.join(Rails.root, 'app', 'assets', 'documents', 'ryan_romanchuk.pdf')).read
  end
end
