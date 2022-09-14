module Wx
  class BatchesController < ApplicationController
    before_action :set_breadcrumbs
    let(:redis) { RedisClient.new }
    let(:dr_pagy)
    let(:batches) do
      relation = Batch.all
      relation = apply_filter(relation)
      relation = apply_sort(relation)

      @dr_pagy, _batches = pagy(relation, items: 3)
      _batches
    end
    let(:batch) { Batch.find(params[:id]) }
    let(:ar_etag) { redis.call('GET', 'aircraftreports_previous_etag') }
    let(:failed_redis_set_size) { redis.call('LLEN', 'failed_pireps') }

    def index
      add_breadcrumb('Batches')
    end

    def show
      add_breadcrumb('Batches', wx_batches_url)
      add_breadcrumb("#{batch.id}")
    end

    def debug
      add_breadcrumb('Batches', wx_batches_url)
      add_breadcrumb("#{batch.id}", wx_batch_url(batch))
      add_breadcrumb('Debug')
    end

    def ingest
      if allowed_to?(:ingest?, current_user, with: BatchPolicy)
        Wx::Pireps::Ingest.async_call
        Wx::Metars::Ingest.async_call
        Wx::Tafs::Ingest.async_call
        redirect_to wx_batches_path, notice: 'Ingesting data...'
      else
        redirect_to wx_batches_path, notice: 'Not authorized'
      end
    end

    def process_csv
      if allowed_to?(:ingest?, current_user, with: BatchPolicy)
        Batch.pending.first.process_batch!
        redirect_to wx_batches_path, notice: 'Transforming data...'
      else
        redirect_to wx_batches_path, notice: 'Not authorized'
      end
    end

    private

    def set_breadcrumbs
      add_breadcrumb('Home', root_url)
    end

    def apply_filter(relation)
      case params[:filter]
      when 'metars'
        relation.metars.recent
      when 'pireps'
        relation.aircraftreports.recent
      else
        relation
      end
    end

    def apply_sort(relation)
      if params[:sort].present?
        by, direction = params[:sort].split(':')
        relation.reorder(by => direction)
      else
        relation.recent
      end
    end
  end
end
