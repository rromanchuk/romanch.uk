class CreatePgSearchDocuments < ActiveRecord::Migration[7.0]
  def change
    create_table :pg_search_documents, id: :uuid do |t|

      t.timestamps
    end
  end
end
