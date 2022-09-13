module Wx
  class PirepsController < ApplicationController
    before_action :set_breadcrumbs

    let(:dr_pagy)
    let(:pirep) { Pirep.find(params[:id]) }
    let(:pireps) do
      case params[:filter]
      when 'uua'
        add_breadcrumb('Urgent')
        uua_reports
      when 'ua'
        add_breadcrumb('Routine')
        ua_reports
      else
        add_breadcrumb('All')
        relation = Pirep.recent.includes(:batch)
        @dr_pagy, _pireps = pagy(relation, items: 50)
        _pireps
      end
    end

    let(:uua_reports) do
      relation = Pirep
                 .recent
                 .uua
                 .includes(:batch)
      @dr_pagy, _pireps = pagy(relation, items: 50)
      _pireps
    end

    let(:ua_reports) do
      relation = Pirep
                 .recent
                 .ua
                 .includes(:batch)
      @dr_pagy, _pireps = pagy(relation, items: 50)
      _pireps
    end

    def index
      add_breadcrumb('Pilot Reports', wx_pireps_path)
    end

    def show
      add_breadcrumb('Pilot Reports', wx_pireps_path)
      add_breadcrumb(pirep.raw_text)
      fresh_when last_modified: pirep.updated_at.utc, etag: pirep
    end

    def debug
      add_breadcrumb('Pilot Reports', wx_pireps_path)
      add_breadcrumb(pirep.raw_text, wx_pirep_path(pirep))
      add_breadcrumb('Debug')
      fresh_when last_modified: pirep.updated_at.utc, etag: pirep
    end

    def map
      add_breadcrumb('Pilot Reports', wx_pireps_path)
      add_breadcrumb(pirep.raw_text, wx_pirep_path(pirep))
      add_breadcrumb('Location Map')
    end

    def points; end

    # GET /pireps/raw_reports/new
    def new
      @pirep = Pirep.new
    end

    def debug
      add_breadcrumb(pirep.raw_text, wx_pirep_path(pirep))
      add_breadcrumb('Debug')
    end

    # DELETE /pireps/raw_reports/1
    def destroy
      authorize! pirep

      raw_report.destroy
      redirect_to wx_pirep_url, notice: 'Raw report was successfully destroyed.'
    end

    private

    # Only allow a list of trusted parameters through.
    def pireps_params
      params.fetch(:wx_pirep, {})
    end

    def set_breadcrumbs
      add_breadcrumb('Home', root_path)
    end
  end
end
