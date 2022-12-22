class PirepsGin4 < ActiveRecord::Migration[7.0]
  disable_ddl_transaction!
  def change

    add_index :wx_pireps, :searchable_tsearch, using: :gin, algorithm: :concurrently
    remove_index :wx_pireps, :tsvector_remarks_tsearch
  end
end
