class Pireps::RawReportsController < ApplicationController

  # GET /pireps/raw_reports
  def index
    @pireps_raw_reports = Pireps::RawReport.all
  end

  # GET /pireps/raw_reports/1
  def show
  end

  # GET /pireps/raw_reports/new
  def new
    @raw_report = Pireps::RawReport.new
  end

  # GET /pireps/raw_reports/1/edit
  def edit
  end

  # POST /pireps/raw_reports
  def create
    @raw_report = Pireps::RawReport.new(raw_report)

      if @pireps_raw_report.save
        redirect_to pireps_raw_report_url(@pireps_raw_report), notice: "Raw report was successfully created."
      else
        render :new, status: :unprocessable_entity 
      end
  end

  # PATCH/PUT /pireps/raw_reports/1
  def update

    if raw_report.update(pireps_raw_report_params)
      redirect_to pireps_raw_report_url(raw_report), notice: "Raw report was successfully updated." 
    else
      render :edit, status: :unprocessable_entity 
    end

  end

  # DELETE /pireps/raw_reports/1
  def destroy
    @raw_report.destroy
     redirect_to pireps_raw_reports_url, notice: "Raw report was successfully destroyed." }
  end

  private
    # Only allow a list of trusted parameters through.
    def pireps_raw_report_params
      params.fetch(:pireps_raw_report, {})
    end
end
