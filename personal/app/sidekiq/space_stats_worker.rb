# frozen_string_literal: true

class SpaceStatsWorker < ApplicationWorker
  sidekiq_options retry: false, queue: :low

  def perform
    PgHero.capture_space_stats
  end
end
