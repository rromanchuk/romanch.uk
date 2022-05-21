class AddImageableColumns < ActiveRecord::Migration[7.0]
  def change
    add_column :images, :imageable_id, :uuid
    add_column :images, :imageable_type, :string
    remove_column :images, :post_id
    add_index :images, [:imageable_type, :imageable_id]
  end
end
