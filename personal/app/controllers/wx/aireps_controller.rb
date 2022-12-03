# frozen_string_literal: true
module Wx
  class AirepsController < ApplicationController
    before_action :set_breadcrumbs
    let(:dr_pagy)
    let(:airep) { Airep.find(params[:id]) }
    let(:aireps) do
      relation = Airep.recent.includes(:batch)
      @dr_pagy, records = pagy(relation, items: 50)
      records
    end

    def index
      add_breadcrumb('Aircraft Reports')
      render stream: true
    end

    def show
      add_breadcrumb('Aircraft Reports', wx_aireps_url)
      add_breadcrumb(airep.raw_text)
      render stream: true
    end

    def map
      add_breadcrumb('Aircraft Reports', wx_aireps_url)
      add_breadcrumb('Location Map')
    end
  end
end
