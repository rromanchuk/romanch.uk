module Wx
  class Taf < ApplicationRecord
    self.implicit_order_column = 'issue_time'
    belongs_to :batch, counter_cache: :metars_count
    scope :recent, -> { order(issue_time: :desc) }


    # SELECT "wx_tafs".* FROM "wx_tafs" WHERE ST_Distance(ST_GeomFromText('POINT (35.17 -79.02 57.0)', 4326), "wx_tafs"."location") < 500
    scope :near, -> (point, radius) {
      where(
        Arel.spatial(point)
          .st_distance(Taf.arel_table[:location])
          .lt(radius)
      )
    }

    def self.process!(batch)
      batch.update!(processed_at: Time.now)
    end
  end
end
