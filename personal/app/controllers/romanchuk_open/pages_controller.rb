
module RomanchukOpen
  class PagesController < RomanchukOpen::ApplicationController
    include HighVoltage::StaticPage
    before_action :set_breadcrumbs
  
    layout "romanchuk_open"

    private
    def page_finder_factory
      DefaultPageFinder
    end
    
    def set_breadcrumbs
      add_breadcrumb("Tournaments", romanchuk_open_tournaments_path)
      case params[:id]
      when 'players'
        add_breadcrumb("Participants")
      end
    end
    
    class DefaultPageFinder < HighVoltage::PageFinder
      def content_path
        'romanchuk_open/pages'
      end
    end
  end
end

