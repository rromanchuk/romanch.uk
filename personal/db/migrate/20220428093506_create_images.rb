class CreateImages < ActiveRecord::Migration[7.0]
  def change
    create_table :images, id: :uuid do |t|
      t.string :key, indexed: true, null: false
      t.string :slug, indexed: true, unique: true
      t.timestamps
    end
  end
end
