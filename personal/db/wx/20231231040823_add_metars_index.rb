class AddMetarsIndex < ActiveRecord::Migration[7.1]
  disable_ddl_transaction!
  def change
    add_index :tds_metars, :observation_time, algorithm: :concurrently
    add_index :tds_batches, :processed_at, algorithm: :concurrently
  end
end
