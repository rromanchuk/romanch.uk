module Wx
  class PirepsController < ApplicationController
    before_action :set_breadcrumbs

    let(:dr_pagy)
    let(:pirep) { Pirep.find(params[:id]) }
    let(:pireps) do
      relation = apply_filter(relation)
      @dr_pagy, _pireps = pagy(relation, items: 50)
      _pireps
    end

    def index
      add_breadcrumb('Pilot Reports', wx_pireps_url)
      render stream: true
    end

    def show
      add_breadcrumb('Pilot Reports', wx_pireps_url)
      add_breadcrumb(pirep.raw_text)
      render stream: true
    end

    def debug
      add_breadcrumb('Pilot Reports', wx_pireps_url)
      add_breadcrumb(pirep.raw_text, wx_pirep_url(pirep))
      add_breadcrumb('Debug')
      render stream: true
    end

    def map
      add_breadcrumb('Pilot Reports', wx_pireps_url)
      add_breadcrumb(pirep.raw_text, wx_pirep_url(pirep))
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
      redirect_to wx_pirep_url, notice: 'Raw report was successfully destroyed.'
    end

    private

    def apply_filter(relation = Pirep.all)
      relation = relation.near(params[:location], 100) if params[:location]

      case params[:filter]
      when 'uua'
        add_breadcrumb('Urgent')
        relation.uua
      when 'ua'
        add_breadcrumb('Routine')
        relation.ua
      else
        add_breadcrumb('All')
        relation
      end.includes(:batch).recent
    end

    # Only allow a list of trusted parameters through.
    def pireps_params
      params.fetch(:wx_pirep, {})
    end
  end
end
