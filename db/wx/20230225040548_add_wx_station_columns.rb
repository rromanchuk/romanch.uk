class AddWxStationColumns < ActiveRecord::Migration[7.0]
  def change
    add_column :wx_station_observations, :solarradiation, :float
    add_column :wx_station_observations, :uv, :integer
    add_column :wx_station_observations, :rainratein, :float
    add_column :wx_station_observations, :eventrainin, :float
    add_column :wx_station_observations, :hourlyrainin, :float
    add_column :wx_station_observations, :dailyrainin, :float
    add_column :wx_station_observations, :weeklyrainin, :float
    add_column :wx_station_observations, :monthlyrainin, :float
    add_column :wx_station_observations, :yearlyrainin, :float
    add_column :wx_station_observations, :totalrainin, :float
    add_column :wx_station_observations, :rrain_piezo, :float
    add_column :wx_station_observations, :erain_piezo, :float
    add_column :wx_station_observations, :hrain_piezo, :float
    add_column :wx_station_observations, :drain_piezo, :float
    add_column :wx_station_observations, :wrain_piezo, :float
    add_column :wx_station_observations, :mrain_piezo, :float
    add_column :wx_station_observations, :yrain_piezo, :float
    add_column :wx_station_observations, :ws90cap_volt, :float
    add_column :wx_station_observations, :ws90_ver, :integer
    add_column :wx_station_observations, :wh68batt, :float
    add_column :wx_station_observations, :wh40batt, :float
    add_column :wx_station_observations, :wh90batt, :float
    add_column :wx_station_observations, :freq, :string
    add_column :wx_station_observations, :model, :string
    add_column :wx_station_observations, :interval, :integer
  end
end
