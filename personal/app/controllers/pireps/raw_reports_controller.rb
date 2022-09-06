class Pireps::RawReportsController < ApplicationController
  let(:dr_pagy)
  let(:raw_report) { Pireps::RawReport.find(params[:id]) }
  let(:raw_reports) do
    case params[:filter]
    when 'uua'
      @dr_pagy, _raw_reports = pagy(Pireps::RawReport.pireps.urgent, items: 50)
      _raw_reports
    else
      @dr_pagy, _raw_reports = pagy(Pireps::RawReport.pireps, items: 50)
      _raw_reports
    end
  end
  # GET /pireps/raw_reports
  def index; end

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
    if raw_report.save
      redirect_to pireps_raw_report_url(raw_report), notice: 'Raw report was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pireps/raw_reports/1
  def update
    if raw_report.update(raw_report_params)
      redirect_to pireps_raw_report_url(raw_report), notice: 'Raw report was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /pireps/raw_reports/1
  def destroy
    raw_report.destroy
    redirect_to pireps_raw_reports_url, notice: 'Raw report was successfully destroyed.'
  end

  private

  # Only allow a list of trusted parameters through.
  def raw_report_params
    params.fetch(:pireps_raw_report, {})
  end
end
