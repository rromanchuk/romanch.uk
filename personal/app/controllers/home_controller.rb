
class HomeController < ApplicationController
  layout :layout_for_page

  def status
    head :ok
  end
  
  def index; end

  private

  def layout_for_page
    case action_name.to_sym
    when :index
      'blog'
    else
      'fluid'
    end
  end
end
