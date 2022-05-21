class AddSlugColumn < ActiveRecord::Migration[7.0]
  def change
    add_column :romanchuk_open_tournaments, :slug, :string
    add_index :romanchuk_open_tournaments, :slug, unique: true
  end
end
