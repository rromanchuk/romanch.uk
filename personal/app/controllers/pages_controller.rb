class PagesController < ApplicationController
  include HighVoltage::StaticPage
  let(:flying_videos) { RyanRomanchuk::StreamingVideo.flying }
  layout :layout_for_page

  # def with_defaults(defaults)
  #   super.merge({ stream: true })
  # end



  private

  def layout_for_page
    case params[:id].to_sym
    when :potree, :model_viewer, :c177, :travis
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
