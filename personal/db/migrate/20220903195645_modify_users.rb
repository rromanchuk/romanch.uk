class ModifyUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :data, :jsonb, default: {}
    drop_table :videos
    drop_table :images
  end
end
