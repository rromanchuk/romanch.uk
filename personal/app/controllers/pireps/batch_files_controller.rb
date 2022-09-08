module Pireps
  class BatchFilesController < ApplicationController
    let(:dr_pagy)
    let(:batch_files) do
      @dr_pagy, _batch_files = pagy(BatchFile.recent, items: 3)
      _batch_files
    end
    let(:batch_file) { BatchFile.find(params[:id]) }
    let(:redis_set_size) { RedisClient.new.call('LLEN', 'pireps') }
    let(:failed_redis_set_size) { RedisClient.new.call('LLEN', 'failed_pireps') }

    def index; end

    def ingest
      if allowed_to?(:ingest?, current_user, with: Pireps::BatchFilePolicy)
        Pireps::Ingest.async_call
        redirect_to pireps_batch_files_path, notice: 'Ingesting data...'
      else
        redirect_to pireps_batch_files_path, notice: 'Not authorized'
      end
    end

    def process_csv
      if allowed_to?(:ingest?, current_user, with: Pireps::BatchFilePolicy)
        Pireps::Process.async_call
        redirect_to pireps_batch_files_path, notice: 'Transforming data...'
      else
        redirect_to pireps_batch_files_path, notice: 'Not authorized'
      end
    end

    def persist_models
      if allowed_to?(:ingest?, current_user, with: Pireps::BatchFilePolicy)
        Pireps::Save.async_call
        redirect_to pireps_batch_files_path, notice: 'Saving data...'
      else
        redirect_to pireps_batch_files_path, notice: 'Not authorized'
      end
    end
  end
end
