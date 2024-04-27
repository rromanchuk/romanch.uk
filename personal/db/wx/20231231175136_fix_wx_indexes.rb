class FixWxIndexes < ActiveRecord::Migration[7.1]
  disable_ddl_transaction!
  def change
    remove_index :tds_metars, name: "index_tds_metars_on_observation_time"
    add_index :tds_metars, :observation_time, algorithm: :concurrently
  end
end
