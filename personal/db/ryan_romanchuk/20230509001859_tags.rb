class Tags < ActiveRecord::Migration[7.0]
  def change
    execute "DROP TABLE #{:gutentag_tags} CASCADE"
    execute "DROP TABLE #{:gutentag_taggings} CASCADE"


    create_table :gutentag_tags, id: :uuid do |t|
      t.string :name,           null: false, index: {unique: true}
      t.bigint :taggings_count, null: false, index: true, default: 0
      t.timestamps              null: false
    end
    
    create_table :gutentag_taggings, id: :uuid do |t|
      t.references :tag,      null: false, type: :uuid,  index: true, foreign_key: {to_table: :gutentag_tags}
      t.references :taggable, null: false, type: :uuid, index: true, polymorphic: true
      t.timestamps            null: false
    end
    add_index :gutentag_taggings, [:taggable_type, :taggable_id, :tag_id], unique: true, name: "gutentag_taggings_uniqueness"
  end
end
