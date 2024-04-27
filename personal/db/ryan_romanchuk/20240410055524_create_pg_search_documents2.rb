class CreatePgSearchDocuments2 < ActiveRecord::Migration[7.1]
  def change
    drop_table :pg_search_documents
    create_table :pg_search_documents do |t|
      t.text :content
      t.belongs_to :searchable, polymorphic: true, type: :uuid, index: true
      t.timestamps null: false
    end
  end
end
