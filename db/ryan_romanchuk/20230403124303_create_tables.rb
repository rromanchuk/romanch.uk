class CreateTables < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pg_stat_statements'
    
    reate_table :posts, id: :uuid do |t|
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

    # create_table :pg_search_documents do |t|
    #   t.text :content
    #   t.belongs_to :searchable, polymorphic: true, type: :uuid, index: true
    #   t.timestamps null: false
    # end

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
