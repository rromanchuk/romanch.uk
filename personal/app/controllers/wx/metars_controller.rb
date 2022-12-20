# frozen_string_literal: true

module Wx
  class MetarsController < ApplicationController
    before_action :set_breadcrumbs
    let(:dr_pagy)
    let(:metar) { Metar.find(params[:id]) }
    let(:metars) do
      relation = apply_filter
      @dr_pagy, records = pagy(relation, items: 25)
      records
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
      relation = relation.search(params[:q]) if params[:q].present?
      
      if params[:station_id]
        add_breadcrumb(params[:station_id], wx_metars_url(station_id: params[:station_id]))
        relation.where(station_id: params[:station_id])
      else
        add_breadcrumb('All')
        relation
      end.recent(:observation_time)
    end
  end
end
