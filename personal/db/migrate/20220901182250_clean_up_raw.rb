class CleanUpRaw < ActiveRecord::Migration[7.0]
  def change
    create_table :pireps_batch_files, id: :uuid do |t|
      t.string :key, null: false, unique: true
      t.string :source_type, null: false, indexed: true
      t.string :source_url, null: false
      t.string :source_etag, null: false, unique: true
      t.string :destination_etag, null: false
      t.datetime :source_last_modified_at, null: false
      t.datetime :source_fetched_at, null: false
      t.datetime :processed_at, indexed: true
      t.integer :num_records_processed, null: false, default: 0
      t.integer :content_length_bytes, null: false, default: 0
      t.jsonb :data, null: false, default: {}
      t.timestamps
    end
  end
end
