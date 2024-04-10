class AddIndexes < ActiveRecord::Migration[7.1]
  disable_ddl_transaction!
  def change
    add_index :tds_batches, :created_at, algorithm: :concurrently
    add_index :tds_batches, :failed_at, algorithm: :concurrently
  end
end
