class AddImageFields < ActiveRecord::Migration[7.0]
  def change
    add_column :images, :slug, :string, index: true, unique: true
  end
end
