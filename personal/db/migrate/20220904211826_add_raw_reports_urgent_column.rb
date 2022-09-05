class AddRawReportsUrgentColumn < ActiveRecord::Migration[7.0]
  def change
    add_column :pireps_raw_reports, :urgent, :boolean, default: false, indexed: true
    add_column :pireps_raw_reports, :station_identifier, :text, indexed: true
  end
end
