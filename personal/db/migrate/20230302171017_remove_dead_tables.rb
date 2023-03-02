class RemoveDeadTables < ActiveRecord::Migration[7.0]
  def change
    drop_table :wx_aireps
    drop_table :wx_pireps
    drop_table :wx_metars
    drop_table :wx_tafs
    drop_table :wx_batches
    drop_table :aircraft_type_designators
  end
end
