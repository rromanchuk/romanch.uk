
class ProjectsController < ApplicationController
  layout 'blog'
  before_action :require_me!
  
  def index; end
  def show; end


  private

  # def layout_for_page
  #   case action_name.to_sym
  #   when :index
  #     'blog'
  #   else
  #     'fluid'
  #   end
  # end
end
