module Wx
  class AirepsController < ApplicationController
    before_action :set_breadcrumbs
    let(:dr_pagy)
    let(:airep) { Airep.find(params[:id]) }
    let(:aireps) do
      relation = Airep.recent.includes(:batch)
      @dr_pagy, _aireps = pagy(relation, items: 50)
      _aireps
    end

    def index
      add_breadcrumb('Aircraft Reports')
    end

    def show
      add_breadcrumb('Aircraft Reports', wx_aireps_url)
      add_breadcrumb(airep.raw_text)
    end

    def map
      add_breadcrumb('Aircraft Reports', wx_aireps_url)
      add_breadcrumb('Location Map')
    end

    def set_breadcrumbs
      add_breadcrumb('Home', root_url)
    end
  end
end
