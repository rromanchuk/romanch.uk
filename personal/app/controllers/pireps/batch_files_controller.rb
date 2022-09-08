module Pireps
  class BatchFilesController < ApplicationController
    let(:dr_pagy)
    let(:batch_files) do
      @dr_pagy, _batch_files = pagy(BatchFile.recent, items: 50)
      _batch_files
    end
    let(:redis_set_size) { RedisClient.new.call('LLEN', 'pireps') }

    def index; end

    def ingest
      Pireps::Ingest.async_call
      redirect_to pireps_batch_files_path, notice: 'Ingesting data...'
    end
  end
end
