class RawReport2 < ActiveRecord::Migration[7.0]
  def change
    drop_table :pireps_raw_reports
    create_table :pireps_raw_reports, id: :uuid do |t|
      t.references :batch_file, type: :uuid, null: false, foreign_key: { to_table: :pireps_batch_files }
      t.text :raw_text, null: false
      t.datetime :receipt_time, null: false
      t.datetime :observation_time
      t.text :quality_control_flags
      t.text :aircraft_ref, null: false
      t.float :latitude
      t.float :longitude
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
      t.text :report_type, null: false
      t.jsonb :data, null: false, default: {}
      t.timestamps
    end
  end
end
