class AddBatchReference < ActiveRecord::Migration[7.0]
  def change
    add_reference :wx_metars, :batch, type: :uuid, index: true
  end
end
