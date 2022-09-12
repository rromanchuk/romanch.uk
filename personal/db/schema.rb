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

ActiveRecord::Schema[7.0].define(version: 2022_09_12_170518) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_stat_statements"
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "active_storage_attachments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.uuid "record_id", null: false
    t.uuid "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "aircraft_type_designators", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "slug"
  end

  create_table "attachments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "blob_id", null: false
    t.string "record_type", null: false
    t.uuid "record_id", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blob_id"], name: "index_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_attachments_uniqueness", unique: true
  end

  create_table "blobs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "key", null: false
    t.string "slug"
    t.jsonb "data", default: {}, null: false
    t.string "content_type"
    t.string "title"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "gutentag_taggings", force: :cascade do |t|
    t.integer "tag_id", null: false
    t.uuid "taggable_id", null: false
    t.string "taggable_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_id"], name: "index_gutentag_taggings_on_tag_id"
    t.index ["taggable_type", "taggable_id", "tag_id"], name: "unique_taggings", unique: true
    t.index ["taggable_type", "taggable_id"], name: "index_gutentag_taggings_on_taggable_type_and_taggable_id"
  end

  create_table "gutentag_tags", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_gutentag_tags_on_name", unique: true
    t.index ["taggings_count"], name: "index_gutentag_tags_on_taggings_count"
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text "content"
    t.string "searchable_type"
    t.bigint "searchable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable"
  end

  create_table "pghero_query_stats", force: :cascade do |t|
    t.text "database"
    t.text "user"
    t.text "query"
    t.bigint "query_hash"
    t.float "total_time"
    t.bigint "calls"
    t.datetime "captured_at", precision: nil
    t.index ["database", "captured_at"], name: "index_pghero_query_stats_on_database_and_captured_at"
  end

  create_table "pghero_space_stats", force: :cascade do |t|
    t.text "database"
    t.text "schema"
    t.text "relation"
    t.bigint "size"
    t.datetime "captured_at", precision: nil
    t.index ["database", "captured_at"], name: "index_pghero_space_stats_on_database_and_captured_at"
  end

  create_table "posts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.text "html_content"
    t.text "markdown_content"
    t.boolean "published"
    t.index ["slug"], name: "index_posts_on_slug", unique: true
  end

  create_table "romanchuk_open_golfers", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "player_id"
    t.uuid "tournament_id"
    t.jsonb "data", default: {}, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_romanchuk_open_golfers_on_player_id"
    t.index ["tournament_id"], name: "index_romanchuk_open_golfers_on_tournament_id"
  end

  create_table "romanchuk_open_players", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.jsonb "data", default: {}, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_romanchuk_open_players_on_slug"
  end

  create_table "romanchuk_open_tournaments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "city"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.jsonb "data", default: {}, null: false
    t.datetime "ocurred_on"
    t.string "slug"
    t.index ["slug"], name: "index_romanchuk_open_tournaments_on_slug", unique: true
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "cognito_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.string "username"
    t.jsonb "data", default: {}
    t.index ["slug"], name: "index_users_on_slug", unique: true
  end

  create_table "wx_aireps", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "batch_id", null: false
    t.text "raw_text", null: false
    t.datetime "receipt_time", null: false
    t.datetime "observation_time"
    t.text "aircraft_ref"
    t.integer "altitude_ft_msl"
    t.jsonb "sky_condition", default: [], null: false
    t.jsonb "turbulence_condition", default: [], null: false
    t.jsonb "icing_condition", default: [], null: false
    t.integer "visibility_statute_mi"
    t.string "wx_string"
    t.float "temp_c"
    t.integer "wind_dir_degrees"
    t.integer "wind_speed_kt"
    t.integer "vert_gust_kt"
    t.geography "location", limit: {:srid=>4326, :type=>"st_point", :has_z=>true, :geographic=>true}
    t.jsonb "data", default: {}, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["batch_id"], name: "index_wx_aireps_on_batch_id"
    t.index ["location"], name: "index_wx_aireps_on_location", using: :gist
    t.index ["raw_text", "observation_time"], name: "index_wx_aireps_uniqueness", unique: true
  end

  create_table "wx_batches", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "key", null: false
    t.text "report_type", null: false
    t.text "source_url"
    t.integer "num_records_processed", default: 0, null: false
    t.integer "content_length", default: 0, null: false
    t.jsonb "data", default: {}, null: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "processed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "pireps_count", default: 0
    t.integer "aireps_count", default: 0
    t.integer "metars_count", default: 0
  end

  create_table "wx_metars", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.text "raw_text", null: false
    t.text "station_id", null: false
    t.datetime "observation_time", null: false
    t.geography "location", limit: {:srid=>4326, :type=>"st_point", :has_z=>true, :geographic=>true}
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
    t.uuid "batch_id"
    t.index ["batch_id"], name: "index_wx_metars_on_batch_id"
    t.index ["location"], name: "index_wx_metars_on_location", using: :gist
    t.index ["station_id", "observation_time"], name: "index_wx_metars_uniqueness", unique: true
  end

  create_table "wx_pireps", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "batch_id", null: false
    t.text "raw_text", null: false
    t.datetime "receipt_time"
    t.datetime "observation_time"
    t.text "aircraft_ref"
    t.integer "altitude_ft_msl"
    t.jsonb "sky_condition", default: [], null: false
    t.jsonb "turbulence_condition", default: [], null: false
    t.jsonb "icing_condition", default: [], null: false
    t.integer "visibility_statute_mi"
    t.string "wx_string"
    t.float "temp_c"
    t.integer "wind_dir_degrees"
    t.integer "wind_speed_kt"
    t.integer "vert_gust_kt"
    t.geography "location", limit: {:srid=>4326, :type=>"st_point", :has_z=>true, :geographic=>true}
    t.jsonb "data", default: {}, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "urgent", default: false
    t.index ["batch_id"], name: "index_wx_pireps_on_batch_id"
    t.index ["location"], name: "index_wx_pireps_on_location", using: :gist
    t.index ["raw_text", "observation_time"], name: "index_wx_pireps_uniqueness", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "wx_aireps", "wx_batches", column: "batch_id"
  add_foreign_key "wx_pireps", "wx_batches", column: "batch_id"
end
