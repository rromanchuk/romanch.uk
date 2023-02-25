class AddWxStationColumns3 < ActiveRecord::Migration[7.0]
  def change
    add_column :wx_station_observations, :humidityin, :integer
    add_column :wx_station_observations, :baromrelin, :float
    add_column :wx_station_observations, :baromabsin, :float
    add_column :wx_station_observations, :tempf, :float
    add_column :wx_station_observations, :humidity, :integer
    
  end
end
