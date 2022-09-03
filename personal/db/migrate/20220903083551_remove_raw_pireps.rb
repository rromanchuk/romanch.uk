class RemoveRawPireps < ActiveRecord::Migration[7.0]
  def change
    drop_table :pireps_raw_pireps
  end
end
