class AddUniqueIndex < ActiveRecord::Migration[7.0]
  def change
    add_index :pireps_raw_reports, %i[report_type aircraft_ref observation_time], name: 'index_pireps_raw_reports_uniqueness',
                                                                                  unique: true
  end
end
