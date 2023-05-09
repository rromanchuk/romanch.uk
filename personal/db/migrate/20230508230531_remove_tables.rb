class RemoveTables < ActiveRecord::Migration[7.0]
  def change
    drop_table :active_storage_attachments
    drop_table :active_storage_variant_records
    drop_table :active_storage_blobs
    
    drop_table :pghero_query_stats
    drop_table :pghero_space_stats
    drop_table :pg_search_documents

  end
end
