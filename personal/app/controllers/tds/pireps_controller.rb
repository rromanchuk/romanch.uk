# frozen_string_literal: true

module Tds
  class PirepsController < ApplicationController
    before_action :set_breadcrumbs

    let(:dr_pagy)
    let(:pirep) { Pirep.find(params[:id]) }
    let(:pireps) do
      relation = apply_filter
      @dr_pagy, records = pagy_countless(relation, items: 50)
      records
    end
    let(:station) { Station.find(params[:station_id]) }

    def index
      add_breadcrumb('Pilot Reports', tds_pireps_url)
    end

    def show
      add_breadcrumb('Pilot Reports', tds_pireps_url)
      add_breadcrumb(pirep.raw_text)
    end

    def debug
      add_breadcrumb('Pilot Reports', tds_pireps_url)
      add_breadcrumb(pirep.raw_text, tds_pirep_url(pirep))
      add_breadcrumb('Debug')
    end

    def map
      add_breadcrumb('Pilot Reports', tds_pireps_url)
      add_breadcrumb(pirep.raw_text, tds_pirep_url(pirep))
      add_breadcrumb('Location Map')
    end

    def points; end

    # GET /pireps/raw_reports/new
    def new
      @pirep = Pirep.new
    end

    # DELETE /pireps/raw_reports/1
    def destroy
      authorize! pirep

      raw_report.destroy
      redirect_to tds_pirep_url, notice: 'Raw report was successfully destroyed.'
    end

    private

    def apply_filter
      relation = Pirep.recent(:observation_time)
      #relation = relation.near(params[:location], 100) if params[:location].present?
      #relation = relation.search(params[:q]) if params[:q].present?

      if params[:station_id]
        add_breadcrumb(station.code, tds_station_pireps_url(station))
        relation = station.pireps
      end

      case params[:filter]
      when 'uua'
        add_breadcrumb('Urgent')
        relation = relation.uua
      when 'ua'
        add_breadcrumb('Routine')
        relation = relation.ua
      else
        add_breadcrumb('All')
      end
      
      relation.includes(:batch)
    end

    # Only allow a list of trusted parameters through.
    def pireps_params
      params.fetch(:wx_pirep, {})
    end
  end
end
