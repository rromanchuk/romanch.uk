class AddPirepsCountToBatches < ActiveRecord::Migration[7.0]
  def change
    add_column :wx_batches, :pireps_count, :integer, default: 0
    add_column :wx_batches, :aireps_count, :integer, default: 0
  end
end
