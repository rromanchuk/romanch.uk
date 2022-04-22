class FigTaggings < ActiveRecord::Migration[7.0]
  def change
    # drop_table :gutentag_tags
    # drop_table :gutentag_taggings

    # create_table :gutentag_taggings do |t|
    #   t.integer :tag_id,        :null => false
    #   t.uuid :taggable_id,   :null => false
    #   t.string  :taggable_type, :null => false
    #   t.timestamps :null => false
    # end

    # add_index :gutentag_taggings, :tag_id
    # add_index :gutentag_taggings, %i[ taggable_type taggable_id ]
    # add_index :gutentag_taggings, %i[ taggable_type taggable_id tag_id ],
    #   :unique => true, :name => "unique_taggings"

    # create_table :gutentag_tags do |t|
    #   t.string :name, :null => false
    #   t.timestamps :null => false
    # end

    # add_index :gutentag_tags, :name, :unique => true

    # add_column :gutentag_tags, :taggings_count, :integer, :default => 0
    # add_index  :gutentag_tags, :taggings_count

    # Gutentag::Tag.reset_column_information
    # Gutentag::Tag.pluck(:id).each do |tag_id|
    #   Gutentag::Tag.reset_counters tag_id, :taggings
    # end
  end
end
