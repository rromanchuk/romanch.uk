module Pireps
  class RawReportsController < ApplicationController
    let(:dr_pagy)
    let(:raw_report) { RawReport.find(params[:id]) }
    let(:raw_reports) do
      case params[:filter]
      when 'uua'
        uua_reports
      when 'ua'
        ua_reports
      when 'airep'
        aireps
      else
        @dr_pagy, _raw_reports = pagy(RawReport.pireps.recent, items: 50)
        _raw_reports
      end
    end

    let(:uua_reports) do
      @dr_pagy, _raw_reports = pagy(RawReport.pireps.urgent.recent, items: 50)
      _raw_reports
    end

    let(:ua_reports) do
      @dr_pagy, _raw_reports = pagy(RawReport.pireps.routine.recent, items: 50)
      _raw_reports
    end

    let(:aireps) do
      @dr_pagy, _raw_reports = pagy(RawReport.aireps.recent, items: 50)
      _raw_reports
    end

    # GET /pireps/raw_reports
    def index; end

    def uua; end
    def uu; end
    def airep; end

    # GET /pireps/raw_reports/1
    def show; end

    # GET /pireps/raw_reports/new
    def new
      @raw_report = Pireps::RawReport.new
    end

    # GET /pireps/raw_reports/1/edit
    def edit; end

    # POST /pireps/raw_reports
    def create
      @raw_report = Pireps::RawReport.new(raw_report_params)
      authorize! raw_report

      if raw_report.save
        redirect_to pireps_raw_report_url(raw_report), notice: 'Raw report was successfully created.'
      else
        render :new, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /pireps/raw_reports/1
    def update
      authorize! raw_report

      if raw_report.update(raw_report_params)
        redirect_to pireps_raw_report_url(raw_report), notice: 'Raw report was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    # DELETE /pireps/raw_reports/1
    def destroy
      authorize! raw_report

      raw_report.destroy
      redirect_to pireps_raw_reports_url, notice: 'Raw report was successfully destroyed.'
    end

    # PUT /pireps/raw_reports/1/set_geometry
    def set_geometry
      raw_report.set_geometry!
      pireps_raw_report_url(raw_report), notice: 'Geometry was successfully set.'
    end

    private

    # Only allow a list of trusted parameters through.
    def raw_report_params
      params.fetch(:pireps_raw_report, {})
    end
  end
end
