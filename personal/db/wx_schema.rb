# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2024_04_10_023029) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_stat_statements"
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "spatial_ref_sys", primary_key: "srid", id: :integer, default: nil, force: :cascade do |t|
    t.string "auth_name", limit: 256
    t.integer "auth_srid"
    t.string "srtext", limit: 2048
    t.string "proj4text", limit: 2048
    t.check_constraint "srid > 0 AND srid <= 998999", name: "spatial_ref_sys_srid_check"
  end

  create_table "tds_aircraft_type_designators", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.text "icao_code", null: false
    t.text "aircraft_class"
    t.integer "number_of_engines"
    t.text "engine_type"
    t.text "weight_class"
    t.text "icao_wtc"
    t.text "recat"
    t.text "recat_wtc_a"
    t.text "recat_wtc_b"
    t.text "cwtc"
    t.text "srs"
    t.text "lahso"
    t.text "manufacturer"
    t.text "model"
    t.jsonb "data", default: {}, null: false
    t.text "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["icao_code"], name: "index_unique_tds_aircraft_type_designators_icao_code", unique: true
    t.index ["slug"], name: "index_tds_aircraft_type_designators_on_slug"
  end

  create_table "tds_aireps", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "batch_id"
    t.text "raw_text", null: false
    t.datetime "receipt_time", null: false
    t.datetime "observation_time"
    t.text "aircraft_ref"
    t.integer "altitude_ft_msl"
    t.float "latitude"
    t.float "longitude"
    t.jsonb "turbulence_condition"
    t.jsonb "icing_condition"
    t.float "temp_c"
    t.integer "wind_dir_degrees"
    t.integer "wind_speed_kt"
    t.integer "vert_gust_kt"
    t.jsonb "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["batch_id"], name: "index_tds_aireps_on_batch_id"
    t.index ["observation_time"], name: "index_tds_aireps_on_observation_time"
    t.index ["raw_text", "observation_time"], name: "index_tds_aireps_uniqueness", unique: true
  end

  create_table "tds_batches", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "key", null: false
    t.text "report_type", null: false
    t.text "source_url"
    t.text "s3_select_expression"
    t.integer "num_records_processed", default: 0, null: false
    t.integer "content_length", default: 0, null: false
    t.integer "metars_count", default: 0, null: false
    t.integer "tafs_count", default: 0, null: false
    t.integer "pireps_count", default: 0, null: false
    t.jsonb "data", default: {}, null: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "processed_at"
    t.datetime "failed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_at"], name: "index_tds_batches_on_created_at"
    t.index ["failed_at"], name: "index_tds_batches_on_failed_at"
    t.index ["key"], name: "index_unique_tds_batches_key", unique: true
    t.index ["processed_at"], name: "index_tds_batches_on_processed_at"
    t.index ["report_type"], name: "index_tds_batches_on_report_type"
  end

  create_table "tds_metars", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "batch_id"
    t.uuid "station_id"
    t.text "raw_text", null: false
    t.datetime "observation_time", null: false
    t.float "temp_c"
    t.float "dewpoint_c"
    t.integer "wind_dir_degrees"
    t.integer "wind_speed_kt"
    t.integer "wind_gust_kt"
    t.float "visibility_statute_mi"
    t.float "altim_in_hg"
    t.float "sea_level_pressure_mb"
    t.text "wx_string"
    t.jsonb "sky_condition"
    t.text "flight_category"
    t.float "three_hr_pressure_tendency_mb"
    t.float "maxT_c"
    t.float "minT_c"
    t.float "maxT24hr_c"
    t.float "minT24hr_c"
    t.float "precip_in"
    t.float "pcp3hr_in"
    t.float "pcp6hr_in"
    t.float "pcp24hr_in"
    t.float "snow_in"
    t.integer "vert_vis_ft"
    t.text "metar_type"
    t.jsonb "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["batch_id"], name: "index_tds_metars_on_batch_id"
    t.index ["observation_time"], name: "index_tds_metars_on_observation_time"
    t.index ["station_id", "observation_time"], name: "index_tds_metars_uniqueness", unique: true
    t.index ["station_id"], name: "index_tds_metars_on_station_id"
  end

  create_table "tds_pireps", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "batch_id"
    t.uuid "station_id"
    t.uuid "aircraft_type_designator_id"
    t.text "raw_text", null: false
    t.boolean "urgent", default: false, null: false
    t.text "remarks"
    t.datetime "receipt_time"
    t.datetime "observation_time"
    t.text "aircraft_ref"
    t.float "latitude"
    t.float "longitude"
    t.integer "altitude_ft_msl"
    t.jsonb "sky_condition"
    t.jsonb "turbulence_condition"
    t.jsonb "icing_condition"
    t.integer "visibility_statute_mi"
    t.string "wx_string"
    t.float "temp_c"
    t.integer "wind_dir_degrees"
    t.integer "wind_speed_kt"
    t.integer "vert_gust_kt"
    t.jsonb "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aircraft_type_designator_id"], name: "index_tds_pireps_on_aircraft_type_designator_id"
    t.index ["batch_id"], name: "index_tds_pireps_on_batch_id"
    t.index ["observation_time"], name: "index_tds_pireps_on_observation_time"
    t.index ["raw_text", "observation_time"], name: "index_tds_pireps_uniqueness", unique: true
    t.index ["station_id"], name: "index_tds_pireps_on_station_id"
    t.index ["urgent"], name: "index_tds_pireps_on_urgent"
  end

  create_table "tds_stations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.text "code"
    t.float "elevation_m"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_unique_tds_stations_code", unique: true
  end

  create_table "tds_tafs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "batch_id"
    t.uuid "station_id"
    t.text "raw_text"
    t.datetime "issue_time", null: false
    t.datetime "bulletin_time"
    t.datetime "valid_time_from"
    t.datetime "valid_time_to"
    t.text "remarks"
    t.jsonb "forecast"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["batch_id"], name: "index_tds_tafs_on_batch_id"
    t.index ["issue_time"], name: "index_tds_tafs_on_issue_time"
    t.index ["station_id", "issue_time"], name: "index_tds_tafs_uniqueness", unique: true
    t.index ["station_id"], name: "index_tds_tafs_on_station_id"
  end

  create_table "wx_station_observations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "winddir"
    t.float "windspeedmph"
    t.float "windgustmph"
    t.float "maxdailygust"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "solarradiation"
    t.integer "uv"
    t.float "rainratein"
    t.float "eventrainin"
    t.float "hourlyrainin"
    t.float "dailyrainin"
    t.float "weeklyrainin"
    t.float "monthlyrainin"
    t.float "yearlyrainin"
    t.float "totalrainin"
    t.float "rrain_piezo"
    t.float "erain_piezo"
    t.float "hrain_piezo"
    t.float "drain_piezo"
    t.float "wrain_piezo"
    t.float "mrain_piezo"
    t.float "yrain_piezo"
    t.float "ws90cap_volt"
    t.integer "ws90_ver"
    t.float "wh68batt"
    t.float "wh40batt"
    t.float "wh90batt"
    t.string "freq"
    t.string "model"
    t.integer "interval"
    t.float "tempinf"
    t.integer "humidityin"
    t.float "baromrelin"
    t.float "baromabsin"
    t.float "tempf"
    t.integer "humidity"
  end

  add_foreign_key "tds_aireps", "tds_batches", column: "batch_id"
  add_foreign_key "tds_metars", "tds_batches", column: "batch_id"
  add_foreign_key "tds_metars", "tds_stations", column: "station_id"
  add_foreign_key "tds_pireps", "tds_aircraft_type_designators", column: "aircraft_type_designator_id"
  add_foreign_key "tds_pireps", "tds_batches", column: "batch_id"
  add_foreign_key "tds_pireps", "tds_stations", column: "station_id"
  add_foreign_key "tds_tafs", "tds_batches", column: "batch_id"
  add_foreign_key "tds_tafs", "tds_stations", column: "station_id"
end
