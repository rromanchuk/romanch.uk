# frozen_string_literal: true

class QueryStatsWorker < ApplicationWorker
  sidekiq_options retry: false, queue: :low

  def perform
    PgHero.capture_query_stats
  end
end
