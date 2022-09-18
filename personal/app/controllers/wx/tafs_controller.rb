module Wx
  class TafsController < ApplicationController
    before_action :set_breadcrumbs
    let(:dr_pagy)
    let(:taf) { Taf.find(params[:id]) }
    let(:tafs) do
      add_breadcrumb('All')
      relation = apply_filter.recent
      @dr_pagy, _tafs = pagy(relation, items: 50)
      _tafs
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

    def apply_filter(relation=Taf.all)
      if params[:station_id]
        relation.where(station_id: params[:station_id]) 
      else
        relation
      end
    end
  end
end
