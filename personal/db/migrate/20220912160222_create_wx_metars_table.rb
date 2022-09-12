class CreateWxMetarsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :wx_metars, id: :uuid do |t|
      t.text :raw_text, null: false
      t.text :station_id, null: false
      t.datetime :observation_time, null: false
      t.st_point :location, geographic: true, has_z: true

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

    add_index :wx_metars, %i[station_id observation_time], name: 'index_wx_metars_uniqueness',
                                                           unique: true
    add_index :wx_metars, :location, using: :gist
    add_column :wx_batches, :metars_count, :integer, default: 0
  end
end
