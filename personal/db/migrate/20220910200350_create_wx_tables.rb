class CreateWxTables < ActiveRecord::Migration[7.0]
  def change
    create_table :wx_batches, id: :uuid do |t|
      t.string :key, null: false, indexed: true, unique: true
      t.text :report_type, null: false, indexed: true
      t.text :source_url

      t.integer :num_records_processed, null: false, default: 0
      t.integer :content_length, null: false, default: 0
      t.jsonb :data, null: false, default: {}
      t.datetime :start_time
      t.datetime :end_time
      t.datetime :processed_at
      t.timestamps
    end

    create_table :wx_pireps, id: :uuid do |t|
      t.references :batch, type: :uuid, null: false, foreign_key: { to_table: :wx_batches }
      t.text :raw_text, null: false
      t.datetime :receipt_time
      t.datetime :observation_time
      t.text :aircraft_ref
      t.integer :altitude_ft_msl
      t.jsonb :sky_condition, null: false, default: []
      t.jsonb :turbulence_condition, null: false, default: []
      t.jsonb :icing_condition, null: false, default: []
      t.integer :visibility_statute_mi
      t.string :wx_string
      t.float :temp_c
      t.integer :wind_dir_degrees
      t.integer :wind_speed_kt
      t.integer :vert_gust_kt

      t.st_point :location, geographic: true, has_z: true
      t.jsonb :data, null: false, default: {}
      t.timestamps
    end

    add_index :wx_pireps, %i[raw_text observation_time], name: 'index_wx_pireps_uniqueness',
                                                         unique: true

    create_table :wx_aireps, id: :uuid do |t|
      t.references :batch, type: :uuid, null: false, foreign_key: { to_table: :wx_batches }
      t.text :raw_text, null: false
      t.datetime :receipt_time, null: false
      t.datetime :observation_time
      t.text :aircraft_ref
      t.integer :altitude_ft_msl
      t.jsonb :sky_condition, null: false, default: []
      t.jsonb :turbulence_condition, null: false, default: []
      t.jsonb :icing_condition, null: false, default: []
      t.integer :visibility_statute_mi
      t.string :wx_string
      t.float :temp_c
      t.integer :wind_dir_degrees
      t.integer :wind_speed_kt
      t.integer :vert_gust_kt

      t.st_point :location, geographic: true, has_z: true
      t.jsonb :data, null: false, default: {}
      t.timestamps
    end

    add_index :wx_aireps, %i[raw_text observation_time], name: 'index_wx_aireps_uniqueness',
                                                         unique: true
  end
end
