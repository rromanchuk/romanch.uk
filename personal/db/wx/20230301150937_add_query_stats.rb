class AddQueryStats < ActiveRecord::Migration[7.0]
  def change
    create_table :pghero_query_stats do |t|
      t.text :database
      t.text :user
      t.text :query
      t.integer :query_hash, limit: 8
      t.float :total_time
      t.integer :calls, limit: 8
      t.timestamp :captured_at
    end

    add_index :pghero_query_stats, [:database, :captured_at]

    create_table :pghero_space_stats do |t|
      t.text :database
      t.text :schema
      t.text :relation
      t.integer :size, limit: 8
      t.timestamp :captured_at
    end

    add_index :pghero_space_stats, [:database, :captured_at]
  end
end
