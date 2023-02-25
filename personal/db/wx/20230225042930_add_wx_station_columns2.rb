class AddWxStationColumns2 < ActiveRecord::Migration[7.0]
  def change
    add_column :wx_station_observations, :tempinf, :float
  end
end
