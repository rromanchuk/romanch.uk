class AddIssueTimeIndex < ActiveRecord::Migration[7.0]
  disable_ddl_transaction!
  def change
    add_index :wx_tafs, :issue_time, algorithm: :concurrently
  end
end
