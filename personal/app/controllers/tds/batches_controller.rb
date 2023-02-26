# frozen_string_literal: true

module Tds
  class BatchesController < ApplicationController
    before_action :set_breadcrumbs
    let(:redis) { RedisClient.new }
    let(:dr_pagy)
    let(:batches) do
      relation = apply_filter
      @dr_pagy, records = pagy_countless(relation, items: 3)
      records
    end
    let(:batch) { Batch.find(params[:id]) }
    let(:ar_etag) { redis.call('GET', 'aircraftreports_previous_etag') }
    let(:failed_redis_set_size) { redis.call('LLEN', 'failed_pireps') }

    def index
      add_breadcrumb('Batches')
      render stream: true
    end

    def show
      add_breadcrumb('Batches', tds_batches_url)
      add_breadcrumb("#{batch.id}")
      render stream: true
    end

    def debug
      add_breadcrumb('Batches', tds_batches_url)
      add_breadcrumb("#{batch.id}", tds_batch_url(batch))
      add_breadcrumb('Debug')
      render stream: true
    end

    def ingest
      if allowed_to?(:ingest?, current_user, with: BatchPolicy)
        Pireps::Ingest.async_call
        Metars::Ingest.async_call
        Tafs::Ingest.async_call
        redirect_to tds_batches_path, notice: 'Ingesting data...'
      else
        redirect_to tds_batches_path, notice: 'Not authorized'
      end
    end

    def reprocess
      if allowed_to?(:ingest?, current_user, with: BatchPolicy)
        batch.process_batch!
        redirect_to tds_batches_path, notice: 'Transforming data...'
      else
        redirect_to tds_batches_path, notice: 'Not authorized'
      end
    end

    def process_csv
      if allowed_to?(:ingest?, current_user, with: BatchPolicy)
        Batch.pending.first.process_batch!
        redirect_to tds_batches_path, notice: 'Transforming data...'
      else
        redirect_to tds_batches_path, notice: 'Not authorized'
      end
    end

    private

    def apply_filter(relation = Batch.all)
      case params[:filter]
      when 'metars'
        relation.metars
      when 'pireps'
        relation.aircraftreports
      when 'tafs'
        relation.tafs
      when 'failed'
        relation.failed
      when 'pending'
        relation.pending
      else
        relation
      end.recent
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
