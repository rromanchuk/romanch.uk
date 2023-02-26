# rubocop:disable all
class CreateTdsWx < ActiveRecord::Migration[7.0]
  def change
    create_table :tds_aircraft_type_designators, id: :uuid do |t|
      t.text :icao_code, null: false, index: { unique: true, name: 'index_unique_tds_aircraft_type_designators_icao_code' }
      t.text :aircraft_class

      t.integer :number_of_engines
      t.text :engine_type
      t.text :weight_class

      t.text :icao_wtc
      t.text :recat
      t.text :recat_wtc_a
      t.text :recat_wtc_b
      t.text :cwtc
      t.text :srs
      t.text :lahso
      t.text :manufacturer
      t.text :model
      t.jsonb :data, null: false, default: {}
      t.text :slug, index: true
      t.timestamps
    end

    create_table :tds_stations, id: :uuid do |t|
      t.text :code, index: { unique: true, name: 'index_unique_tds_stations_code' }
      t.float :elevation_m
      t.float :latitude
      t.float :longitude
      t.timestamps
    end

    create_table :tds_batches, id: :uuid do |t|
      t.string :key, null: false, index: {unique: true, name: 'index_unique_tds_batches_key'}
      t.text :report_type, null: false, index: true
      t.text :source_url
      t.text :s3_select_expression

      t.integer :num_records_processed, null: false, default: 0
      t.integer :content_length, null: false, default: 0
      t.integer :metars_count, null: false, default: 0
      t.integer :tafs_count, null: false, default: 0
      t.integer :pireps_count, null: false, default: 0
      t.jsonb :data, null: false, default: {}
      t.datetime :start_time
      t.datetime :end_time
      t.datetime :processed_at
      t.datetime :failed_at
      t.timestamps
    end

    create_table :tds_aireps, id: :uuid do |t|
      t.references :batch, type: :uuid, index: true, foreign_key: { to_table: :tds_batches }
      t.text :raw_text, null: false
      t.datetime :receipt_time, null: false
      t.datetime :observation_time
      t.text :aircraft_ref
      t.integer :altitude_ft_msl
      t.float :latitude
      t.float :longitude
      t.jsonb :turbulence_condition
      t.jsonb :icing_condition
      t.float :temp_c
      t.integer :wind_dir_degrees
      t.integer :wind_speed_kt
      t.integer :vert_gust_kt
      t.jsonb :data
      t.timestamps
    end

    add_index :tds_aireps, %i[raw_text observation_time], name: 'index_tds_aireps_uniqueness',
                                                         unique: true

    create_table :tds_pireps, id: :uuid do |t|
      t.references :batch, type: :uuid, index: true, foreign_key: { to_table: :tds_batches }
      t.references :station, type: :uuid, index: true, foreign_key: { to_table: :tds_stations }
      t.references :aircraft_type_designator, type: :uuid, index: true, foreign_key: { to_table: :tds_aircraft_type_designators }
      t.text :raw_text, null: false
      t.boolean :urgent, null: false, default: false, index: true
      t.text :remarks

      t.datetime :receipt_time
      t.datetime :observation_time
      t.text :aircraft_ref
      t.float :latitude
      t.float :longitude
      t.integer :altitude_ft_msl
      t.jsonb :sky_condition
      t.jsonb :turbulence_condition
      t.jsonb :icing_condition
      t.integer :visibility_statute_mi
      t.string :wx_string
      t.float :temp_c
      t.integer :wind_dir_degrees
      t.integer :wind_speed_kt
      t.integer :vert_gust_kt
      t.jsonb :data
      t.timestamps
    end

    add_index :tds_pireps, %i[raw_text observation_time], name: 'index_tds_pireps_uniqueness',
                                                         unique: true
    
    

    create_table :tds_tafs, id: :uuid do |t|
      t.references :batch, type: :uuid, index: true, foreign_key: { to_table: :tds_batches }
      t.references :station, type: :uuid, index: true, foreign_key: { to_table: :tds_stations }
      t.text :raw_text
      t.datetime :issue_time, null: false, index: true
      t.datetime :bulletin_time
      t.datetime :valid_time_from
      t.datetime :valid_time_to
      t.text :remarks
      t.jsonb :forecast
      t.timestamps
    end

    add_index :tds_tafs, [:station_id, :issue_time], name: 'index_tds_tafs_uniqueness', unique: true


    create_table :tds_metars, id: :uuid do |t|
      t.references :batch, type: :uuid, index: true, foreign_key: { to_table: :tds_batches }
      t.references :station, type: :uuid, index: true, foreign_key: { to_table: :tds_stations }
      t.text :raw_text, null: false
      t.datetime :observation_time, null: false
    

      t.float :temp_c
      t.float :dewpoint_c
      t.integer :wind_dir_degrees
      t.integer :wind_speed_kt
      t.integer :wind_gust_kt
      t.float :visibility_statute_mi
      t.float :altim_in_hg
      t.float :sea_level_pressure_mb
      t.text :wx_string
      t.jsonb :sky_condition
      t.text :flight_category

      t.float :three_hr_pressure_tendency_mb
      t.float :maxT_c
      t.float :minT_c
      t.float :maxT24hr_c
      t.float :minT24hr_c
      t.float :precip_in
      t.float :pcp3hr_in
      t.float :pcp6hr_in
      t.float :pcp24hr_in
      t.float :snow_in
      t.integer :vert_vis_ft
      t.text :metar_type

      t.jsonb :data
      t.timestamps
    end

    add_index :tds_metars, %i[station_id observation_time], name: 'index_tds_metars_uniqueness',
                                                           unique: true
  end
end