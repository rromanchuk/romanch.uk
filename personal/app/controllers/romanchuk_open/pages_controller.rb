
module RomanchukOpen
  class PagesController < RomanchukOpen::ApplicationController
    include HighVoltage::StaticPage
  
    layout "romanchuk_open/layouts/application"
    
    private
    def page_finder_factory
      DefaultPageFinder
    end
    
    class DefaultPageFinder < HighVoltage::PageFinder
      def content_path
        'romanchuk_open/pages'
      end
    end
  end
end

