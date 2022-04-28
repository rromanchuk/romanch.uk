class AddMetaDataColumns < ActiveRecord::Migration[7.0]
  def change
    add_column :images, :caption, :string
    add_column :images, :title, :string
    add_column :images, :geo_location, :string

    add_column :videos, :title, :string
    add_column :videos, :description, :string
    add_column :videos, :thumbnail_key, :string
  end
end
