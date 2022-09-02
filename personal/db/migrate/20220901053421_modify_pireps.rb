class ModifyPireps < ActiveRecord::Migration[7.0]
  def change
    add_column :pireps_raw_pireps, :processed_at, :datetime, indexed: true
    add_index :pireps_raw_pireps, :key, unique: true
  end
end
