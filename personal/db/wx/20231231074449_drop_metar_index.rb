class DropMetarIndex < ActiveRecord::Migration[7.1]
  def change
    # remove_index :tds_metars, name: "index_tds_metars_on_observation_time"
    # add_index :tds_metars, :observation_time
  end
end
