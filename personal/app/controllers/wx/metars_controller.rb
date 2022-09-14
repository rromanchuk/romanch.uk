module Wx
  class MetarsController < ApplicationController
    before_action :set_breadcrumbs
    let(:dr_pagy)
    let(:metar) { Metar.find(params[:id]) }
    let(:metars) do
      add_breadcrumb('All')
      relation = Metar.recent.includes(:batch)
      @dr_pagy, _metars = pagy(relation, items: 50)
      _metars
    end

    def debug
      add_breadcrumb('METARs', wx_metars_url)
      add_breadcrumb("#{metar.raw_text}", wx_metar_url(metar))
      add_breadcrumb('Debug')
    end

    def index
      add_breadcrumb('METARs', wx_metars_url)
    end

    def show
      add_breadcrumb('METARs', wx_metars_url)
      add_breadcrumb("#{metar.raw_text}")
      fresh_when last_modified: metar.updated_at.utc, etag: metar
    end

    def set_breadcrumbs
      add_breadcrumb('Home', root_url)
    end
  end
end
