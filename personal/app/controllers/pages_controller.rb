class PagesController < ApplicationController
  include HighVoltage::StaticPage

  layout :layout_for_page

  private

  def layout_for_page
    case params[:id].to_sym
    when :potree, :model_viewer, :c177
      'nostyle'
    when :three, :pe
      'three'
    when :who_dis
      'empty'
    else
      'application'
    end
  end
end
