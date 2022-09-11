module Pireps
  class RawReportsController < ApplicationController
    before_action :set_breadcrumbs

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
        relation = RawReport.recent.includes(:batch_file)
        @dr_pagy, _raw_reports = pagy(relation, items: 50)
        _raw_reports
      end
    end

    let(:uua_reports) do
      relation = RawReport
                 .pireps
                 .urgent
                 .recent
                 .includes(:batch_file)
      @dr_pagy, _raw_reports = pagy(relation, items: 50)
      _raw_reports
    end

    let(:ua_reports) do
      relation = RawReport
                 .pireps
                 .routine
                 .recent
                 .includes(:batch_file)
      @dr_pagy, _raw_reports = pagy(relation, items: 50)
      _raw_reports
    end

    let(:aireps) do
      relation = RawReport
                 .aireps
                 .recent
                 .includes(:batch_file)
      @dr_pagy, _raw_reports = pagy(relation, items: 50)
      _raw_reports
    end

    # GET /pireps/raw_reports
    def index
      add_breadcrumb('Aircraft Reports' pireps_raw_reports_path)
      
    end

    def uua
      add_breadcrumb('Aircraft Reports', pireps_raw_reports_path)
      add_breadcrumb('Urgent')
    end

    def uu
      add_breadcrumb('Aircraft Reports', pireps_raw_reports_path)
      add_breadcrumb('Routine')
    end

    def airep
      add_breadcrumb('Aircraft Reports', pireps_raw_reports_path)
      add_breadcrumb('AIREP')
    end

    # GET /pireps/raw_reports/1
    def show
      add_breadcrumb('Aircraft Reports', pireps_raw_reports_path)
      add_breadcrumb(raw_report.raw_text)
    end

    def map
      add_breadcrumb('Aircraft Reports', pireps_raw_reports_path)
      add_breadcrumb(raw_report.raw_text)
    end

    # GET /pireps/raw_reports/new
    def new
      @raw_report = Pireps::RawReport.new
    end

    def debug
      add_breadcrumb(raw_report.raw_text, pireps_raw_report_path(raw_report))
      add_breadcrumb('Debug')
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
      redirect_to pireps_raw_report_url(raw_report), notice: 'Geometry was successfully set.'
    end

    private

    # Only allow a list of trusted parameters through.
    def raw_report_params
      params.fetch(:pireps_raw_report, {})
    end

    def set_breadcrumbs
      add_breadcrumb('Home', root_path)
    end
  end
end
