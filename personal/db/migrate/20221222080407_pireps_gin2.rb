class PirepsGin2 < ActiveRecord::Migration[7.0]
  disable_ddl_transaction!
  def change
    #add_index :wx_pireps, :tsvector_remarks_tsearch, using: :gin, algorithm: :concurrently
  end
end
