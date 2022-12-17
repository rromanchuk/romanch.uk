class AddIndexes < ActiveRecord::Migration[7.0]
  disable_ddl_transaction!
  def change
    add_index :wx_pireps, :observation_time, algorithm: :concurrently
    add_index :wx_metars, :observation_time, algorithm: :concurrently
    add_index :wx_aireps, :observation_time, algorithm: :concurrently
  end
end
