module Ro
  class ApplicationController < ApplicationController
    layout 'romanchuk_open'

    def url_options
      { host: Rails.configuration.general.romanchukopen_host }.merge(super)
    end

    def set_breadcrumbs
      add_breadcrumb('Home', romanchuk_open_tournaments_url)
    end
  end
end
