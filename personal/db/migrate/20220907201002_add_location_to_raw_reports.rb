class AddLocationToRawReports < ActiveRecord::Migration[7.0]
  def change
    enable_extension :postgis
    add_column :pireps_raw_reports, :location, :st_point, geographic: true, has_z: true
  end
end
