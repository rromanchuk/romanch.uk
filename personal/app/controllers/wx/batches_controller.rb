module Wx
  class BatchesController < ApplicationController
    before_action :set_breadcrumbs
    let(:redis) { RedisClient.new }
    let(:dr_pagy)
    let(:batches) do
      @dr_pagy, _batches = pagy(Batch.recent, items: 3)
      _batches
    end
    let(:batch) { Batch.find(params[:id]) }
    let(:ar_etag) { redis.call('GET', 'aircraftreports_previous_etag') }
    let(:failed_redis_set_size) { redis.call('LLEN', 'failed_pireps') }

    def index
      add_breadcrumb('Batches')
    end

    def show
      add_breadcrumb('Batches', wx_batches_path)
      add_breadcrumb("#{batch.id}")
    end

    def ingest
      if allowed_to?(:ingest?, current_user, with: BatchPolicy)
        Wx::Pireps::Ingest.async_call
        Wx::Metars::Ingest.async_call
        redirect_to wx_batches_path, notice: 'Ingesting data...'
      else
        redirect_to wx_batches_path, notice: 'Not authorized'
      end
    end

    def process_csv
      if allowed_to?(:ingest?, current_user, with: BatchPolicy)
        Wx::Pireps::Process.async_call(Batch.pending.first)
        redirect_to wx_batches_path, notice: 'Transforming data...'
      else
        redirect_to wx_batches_path, notice: 'Not authorized'
      end
    end

    private

    def set_breadcrumbs
      add_breadcrumb('Home', root_path)
    end
  end
end
