class ModifyRawReportsIndex < ActiveRecord::Migration[7.0]
  def change
    remove_index :pireps_raw_reports, name: 'index_pireps_raw_reports_uniqueness'
    add_index :pireps_raw_reports, %i[report_type raw_text], name: 'index_pireps_raw_reports_uniqueness',
                                                             unique: true
  end
end
