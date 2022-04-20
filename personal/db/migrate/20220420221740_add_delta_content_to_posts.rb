class AddDeltaContentToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :delta_content, :jsonb, null: false, default: {}
  end
end
