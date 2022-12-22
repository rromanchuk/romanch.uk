class PirepsGin5 < ActiveRecord::Migration[7.0]
  def change
    execute <<-SQL
      ALTER TABLE wx_metars
      ADD COLUMN searchable_tsearch tsvector GENERATED ALWAYS AS (
        setweight(to_tsvector('simple', coalesce(station_id, '')), 'A') ||
        setweight(to_tsvector('simple', coalesce(wx_string, '')), 'B') ||
        setweight(to_tsvector('simple', coalesce(flight_category, '')), 'C') ||
        setweight(to_tsvector('simple', coalesce(raw_text, '')), 'D')
      ) STORED;
    SQL
  end
end
