class RemoveQueryStats < ActiveRecord::Migration[7.1]
  def change
    drop_table :pghero_query_stats
    drop_table :pghero_space_stats
  end
end
