module RomanchukOpen
  class ApplicationController < ApplicationController
    layout 'romanchuk_open'

    def url_options
      { host: Rails.configuration.general.romanchukopen_host }.merge(super)
    end
  end
end
