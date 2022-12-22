class PirepsGin3 < ActiveRecord::Migration[7.0]
  def change
    execute <<-SQL
      ALTER TABLE wx_pireps
      ADD COLUMN searchable_tsearch tsvector GENERATED ALWAYS AS (
        setweight(to_tsvector('simple', coalesce(station, '')), 'A') ||
        setweight(to_tsvector('simple', coalesce(aircraft_ref, '')), 'B') ||
        setweight(to_tsvector('simple', coalesce(remarks, '')), 'C') ||
        setweight(to_tsvector('simple', coalesce(raw_text, '')), 'D')
      ) STORED;
    SQL
  end
end
