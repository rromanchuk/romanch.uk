class DropDeadTAbles < ActiveRecord::Migration[7.0]
  def change
    drop_table :pireps_raw_reports
    drop_table :pireps_batch_files
  end
end
