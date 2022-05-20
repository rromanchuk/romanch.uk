class PagesController < ApplicationController
  include HighVoltage::StaticPage

  layout :layout_for_page

  private

  def layout_for_page
    case params[:id].to_sym
    when :potree, :three
      'naked'
    else
      'application'
    end
  end
end