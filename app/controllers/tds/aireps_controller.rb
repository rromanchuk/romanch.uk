# frozen_string_literal: true
module Tds
  class AirepsController < ApplicationController
    allow_unauthenticated_access
    before_action :set_breadcrumbs
    let(:dr_pagy)
    let(:airep) { Airep.find(params[:id]) }
    let(:aireps) do
      relation = Airep.recent.includes(:batch)
      @dr_pagy, records = pagy_countless(relation, items: 50)
      records
    end

    def index
      add_breadcrumb('Aircraft Reports')
    end

    def show
      add_breadcrumb('Aircraft Reports', tds_aireps_url)
      add_breadcrumb(airep.raw_text)
    end

    def map
      add_breadcrumb('Aircraft Reports', tds_aireps_url)
      add_breadcrumb('Location Map')
    end
  end
end
