class CreateWxStationObservations < ActiveRecord::Migration[7.0]
  def change
    create_table :wx_station_observations, id: :uuid do |t|
      t.integer :winddir
      t.float :windspeedmph
      t.float :windgustmph
      t.float :maxdailygust
      t.timestamps
    end
  end
end
