
class HomeController < ApplicationController
  def status
    head :ok
  end
  def index
    logger.info cookies["AWSELBAuthSessionCookie-0"]
  end

  def resume
   @pdf = File.open(File.join(Rails.root, 'latex', 'main.pdf')).read
  end
end
