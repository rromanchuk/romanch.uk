class CreateAssetsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :assets, id: :uuid do |t|
      t.string :key, indexed: true, null: false, unique: true
      t.string :slug, indexed: true, unique: true
      t.jsonb :data, null: false, default: {}
      t.string :content_type
      t.string :title
      t.string :description
      t.timestamps
    end

    create_table :attachments, id: :uuid do |t|
      t.references :asset, null: false, type: :uuid
      t.references :record, null: false, polymorphic: true, index: false, type: :uuid
      t.string :name, null: false
      t.timestamps
      t.index [:record_type, :record_id, :name, :asset_id], name: "index_attachments_uniqueness", unique: true
    end
  end
end
