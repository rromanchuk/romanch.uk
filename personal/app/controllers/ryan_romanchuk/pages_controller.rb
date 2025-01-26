module RyanRomanchuk
  class PagesController < ApplicationController
    include HighVoltage::StaticPage
    let(:flying_videos) { RyanRomanchuk::StreamingVideo.flying }
    layout :layout_for_page
    allow_unauthenticated_access

    # def with_defaults(defaults)
    #   super.merge({ stream: true })
    # end
    def page_finder_factory
      DefaultPageFinder
    end

    class DefaultPageFinder < HighVoltage::PageFinder
      def content_path
        'ryan_romanchuk/pages'
      end
    end


    private

    def layout_for_page
      case params[:id].to_sym
      when :potree, :model_viewer, :c177, :travis
        'ryan_romanchuk/layouts/nostyle'
      when :three, :pe
        'ryan_romanchuk/three'
      when :who_dis
        'ryan_romanchuk/empty'
      else
        'ryan_romanchuk/application'
      end
    end
  end
end
