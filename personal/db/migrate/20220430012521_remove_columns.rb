class RemoveColumns < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :published
    remove_column :posts, :delta_content
    remove_column :posts, :body
  end
end
