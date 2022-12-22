class PirepsGin6 < ActiveRecord::Migration[7.0]
  disable_ddl_transaction!
  def change
    add_index :wx_metars, :searchable_tsearch, using: :gin, algorithm: :concurrently
  end
end
