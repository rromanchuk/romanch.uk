# frozen_string_literal: true

module Wx
  class TafsController < ApplicationController
    before_action :set_breadcrumbs
    let(:dr_pagy)
    let(:taf) { Taf.find(params[:id]) }
    let(:tafs) do
      add_breadcrumb('All')
      relation = apply_filter
      @dr_pagy, records = pagy_countless(relation, items: 25)
      records
    end

    def debug
      add_breadcrumb('Terminal Aerodrome Forecast (TAF)', wx_tafs_url)
      add_breadcrumb("#{taf.station_id}", wx_taf_url(taf))
      add_breadcrumb('Debug')
    end

    def index
      add_breadcrumb('Terminal Aerodrome Forecast (TAF)', wx_tafs_url)
      render stream: true
    end

    def show
      add_breadcrumb('Terminal Aerodrome Forecast (TAF)', wx_tafs_url)
      add_breadcrumb("#{taf.station_id}")
      render stream: true
    end

    def apply_filter(relation = Taf.all)
      relation = relation.search(params[:q]) if params[:q].present?

      if params[:station_id]
        raise(ActionController::BadRequest, 'Invalid HTTP parameters.') if params[:station_id].length > 4
        
        relation.where(station_id: params[:station_id])
      else
        relation
      end.recent
    end
  end
end
