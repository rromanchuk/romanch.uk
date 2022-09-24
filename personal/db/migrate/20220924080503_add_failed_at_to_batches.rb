class AddFailedAtToBatches < ActiveRecord::Migration[7.0]
  def change
    add_column :wx_batches, :failed_at, :datetime
  end
end
