module Pireps
  class PilotReportsController < ApplicationController
    let(:next_page) { params[:next_page_token] ? JSON.parse(Base64.decode64(params[:next_page_token])) : nil}
    let(:metadata)
    let(:pilot_reports) do
      records, @metadata = Pireps::PilotReport.start(next_page).find_by_pages.first
      records
    end
    
    def index
      
    end
  end
end