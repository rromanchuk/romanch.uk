module Wx
  class BatchesController < ApplicationController
    before_action :set_breadcrumbs

    let(:dr_pagy)
    let(:batches) do
      @dr_pagy, _batch_files = pagy(Batch.recent, items: 3)
      _batch_files
    end
    let(:batch) { Batch.find(params[:id]) }
    let(:redis_set_size) { RedisClient.new.call('LLEN', 'pireps') }
    let(:failed_redis_set_size) { RedisClient.new.call('LLEN', 'failed_pireps') }

    def index
      add_breadcrumb('Batches')
    end

    def show
      add_breadcrumb('Batches', wx_batches_path)
      add_breadcrumb("#{batch.id}")
    end

    def ingest
      if allowed_to?(:ingest?, current_user, with: Pireps::BatchFilePolicy)
        Wx::Pireps::Ingest.async_call
        redirect_to wx_batches_path, notice: 'Ingesting data...'
      else
        redirect_to wx_batches_path, notice: 'Not authorized'
      end
    end

    def process_csv
      if allowed_to?(:ingest?, current_user, with: Pireps::BatchFilePolicy)
        Wx::Pireps::Process.async_call
        redirect_to wx_batches_path, notice: 'Transforming data...'
      else
        redirect_to wx_batches_path, notice: 'Not authorized'
      end
    end

    def persist_models
      # if allowed_to?(:ingest?, current_user, with: Pireps::BatchFilePolicy)
      #   Pireps::Save.async_call
      #   redirect_to pireps_batch_files_path, notice: 'Saving data...'
      # else
      #   redirect_to pireps_batch_files_path, notice: 'Not authorized'
      # end
    end

    private

    def set_breadcrumbs
      add_breadcrumb('Home', root_path)
    end
  end
end
