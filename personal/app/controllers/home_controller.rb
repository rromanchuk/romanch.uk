
class HomeController < ApplicationController
  def status
    head :ok
  end
  
  def index; end

  def resume
    @pdf = File.open(File.join(Rails.root, 'latex', 'main.pdf')).read
  end
end
