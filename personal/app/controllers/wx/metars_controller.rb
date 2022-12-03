# frozen_string_literal: true

module Wx
  class MetarsController < ApplicationController
    before_action :set_breadcrumbs
    let(:dr_pagy)
    let(:metar) { Metar.find(params[:id]) }
    let(:metars) do
      relation = apply_filter
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
      render stream: true
    end

    def show
      add_breadcrumb('METARs', wx_metars_url)
      add_breadcrumb("#{metar.raw_text}")
      render stream: true
    end

    private

    def apply_filter(relation = Metar.all)
      if params[:station_id]
        add_breadcrumb(params[:station_id], wx_metars_url(station_id: params[:station_id]))
        relation.where(station_id: params[:station_id])
      else
        add_breadcrumb('All')
        relation
      end.recent
    end
  end
end
