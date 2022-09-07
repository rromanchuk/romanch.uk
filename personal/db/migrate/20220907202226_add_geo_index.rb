class AddGeoIndex < ActiveRecord::Migration[7.0]
  def change
    add_index :pireps_raw_reports, :location, using: :gist
  end
end
