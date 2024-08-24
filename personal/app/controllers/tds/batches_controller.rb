# frozen_string_literal: true

module Tds
  class BatchesController < ApplicationController
    before_action :set_breadcrumbs
    let(:dr_pagy)
    let(:batches) do
      relation = apply_filter
      @dr_pagy, records = pagy_countless(relation, items: 3)
      records
    end
    let(:batch) { Batch.find(params[:id]) }
    let(:ar_etag) do
      Personal.redis.with do |redis|
        edis.call('GET', 'aircraftreports_previous_etag')
      end
    end
    
    let(:failed_redis_set_size) do 
      Personal.redis.with do |redis|
        redis.call('LLEN', 'failed_pireps')   
      end  
    end

    def index
      add_breadcrumb('Batches')
    end

    def show
      add_breadcrumb('Batches', tds_batches_url)
      add_breadcrumb("#{batch.id}")
    end

    def debug
      add_breadcrumb('Batches', tds_batches_url)
      add_breadcrumb("#{batch.id}", tds_batch_url(batch))
      add_breadcrumb('Debug')
    end

    def ingest
      if allowed_to?(:ingest?, current_user, with: BatchPolicy)
        Pireps::Ingest.call
        Metars::Ingest.call
        Tafs::Ingest.call
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

    def apply_filter
      relation = Batch.recent
      
      case params[:filter]
      when 'metars'
        relation = relation.metars
      when 'pireps'
        relation = relation.aircraftreports
      when 'tafs'
        relation = relation.tafs
      when 'failed'
        relation = relation.failed
      when 'pending'
        relation = relation.pending
      end

      relation
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
