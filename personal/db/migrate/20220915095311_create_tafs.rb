class CreateTafs < ActiveRecord::Migration[7.0]
  def change
    create_table :wx_tafs, id: :uuid do |t|
      t.text :raw_text
      t.text :station_id, null: false
      t.datetime :issue_time, null: false
      t.datetime :bulletin_time
      t.datetime :valid_time_from
      t.datetime :valid_time_to
      t.text :remarks
      t.st_point :location, geographic: true, has_z: true
      t.jsonb :forecast

      t.timestamps
    end

    add_index :wx_tafs, [:station_id, :issue_time], name: 'index_wx_tafs_uniqueness', unique: true
    add_index :wx_tafs, :location, using: :gist
  end
end
