module Ro
  class ApplicationController < ApplicationController
    layout 'romanchuk_open'


    def set_breadcrumbs
      add_breadcrumb('Home', ro_tournaments_url)
    end
  end
end
