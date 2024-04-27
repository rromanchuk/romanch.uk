# frozen_string_literal: true

module Tds
  class MetarsController < ApplicationController
    before_action :set_breadcrumbs
    let(:dr_pagy)
    let(:metar) { Metar.find(params[:id]) }
    let(:metars) do
      relation = apply_filter
      @dr_pagy, records = pagy_countless(relation, items: 25)
      records
    end

    def debug
      add_breadcrumb('METARs', tds_metars_url)
      add_breadcrumb("#{metar.raw_text}", tds_metar_url(metar))
      add_breadcrumb('Debug')
    end

    def index
      add_breadcrumb('METARs', tds_metars_url)
    end

    def show
      add_breadcrumb('METARs', tds_metars_url)
      add_breadcrumb(metar.raw_text)
    end

    private

    def apply_filter
      relation = Metar.recent(:observation_time)
      relation = relation.search(params[:q]) if params[:q].present?
      
      if params[:station_id]
        add_breadcrumb(params[:station_id], tds_metars_url(station_id: params[:station_id]))
        relation = relation.where(station_id: params[:station_id])
      end
      relation
    end
  end
end
