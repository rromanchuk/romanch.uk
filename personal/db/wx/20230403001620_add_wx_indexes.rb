class AddWxIndexes < ActiveRecord::Migration[7.0]
  disable_ddl_transaction!
  def change
    add_index :tds_pireps, :observation_time, algorithm: :concurrently
    add_index :tds_aireps, :observation_time, algorithm: :concurrently
  end
end
