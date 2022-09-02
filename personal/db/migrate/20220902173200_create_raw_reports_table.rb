class CreateRawReportsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :pireps_raw_reports, id: :uuid do |t|
      t.references :batch_file, type: :uuid, null: false, foreign_key: { to_table: :pireps_batch_files }
      t.text :raw_text, null: false
      t.text :report_type, null: false
      t.datetime :receipt_time, null: false
      t.jsonb :data, null: false, default: {}
      t.timestamps
    end
  end
end
