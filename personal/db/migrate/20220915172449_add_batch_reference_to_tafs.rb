class AddBatchReferenceToTafs < ActiveRecord::Migration[7.0]
  def change
    add_reference :wx_tafs, :batch, type: :uuid, index: true
    add_column :wx_batches, :tafs_count, :integer, default: 0
  end
end
