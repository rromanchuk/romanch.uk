class CreateTables < ActiveRecord::Migration[7.0]
  def change
    create_table :gutentag_taggings do |t|
      t.integer :tag_id,        :null => false
      t.integer :taggable_id,   :null => false
      t.string  :taggable_type, :null => false
      t.timestamps :null => false
    end

    add_index :gutentag_taggings, :tag_id
    add_index :gutentag_taggings, %i[ taggable_type taggable_id ]
    add_index :gutentag_taggings, %i[ taggable_type taggable_id tag_id ],
      :unique => true, :name => "unique_taggings"

    create_table :gutentag_tags do |t|
      t.string :name, :null => false
      t.timestamps :null => false
    end

    add_index :gutentag_tags, :name, :unique => true

    add_column :gutentag_tags, :taggings_count, :integer, :default => 0
    add_index  :gutentag_tags, :taggings_count

    Gutentag::Tag.reset_column_information
    Gutentag::Tag.pluck(:id).each do |tag_id|
      Gutentag::Tag.reset_counters tag_id, :taggings
    end

    change_column :gutentag_tags, :taggings_count, :integer,
      :default => 0,
      :null    => false

    create_table :posts, id: :uuid do |t|
      t.string :title
      t.string :slug, index: true, unique: true
      t.text :description
      t.text :html_content
      t.text :markdown_content
      t.boolean :published
      t.timestamps
    end


    create_table :friendly_id_slugs do |t|
      t.string   :slug,           :null => false
      t.integer  :sluggable_id,   :null => false
      t.string   :sluggable_type, :limit => 50
      t.string   :scope
      t.datetime :created_at
    end
    add_index :friendly_id_slugs, [:sluggable_type, :sluggable_id]
    add_index :friendly_id_slugs, [:slug, :sluggable_type], length: { slug: 140, sluggable_type: 50 }
    add_index :friendly_id_slugs, [:slug, :sluggable_type, :scope], length: { slug: 70, sluggable_type: 50, scope: 70 }, unique: true

    create_table :users, id: :uuid do |t|
      t.uuid :cognito_id, indexed: true
      t.string :slug, index: true, unique: true
      t.string :username
      t.jsonb :data, null: false, default: {}
      t.timestamps
    end
  end
end
