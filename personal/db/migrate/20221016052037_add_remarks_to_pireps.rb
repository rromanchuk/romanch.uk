class AddRemarksToPireps < ActiveRecord::Migration[7.0]
  def change
    add_column :wx_pireps, :remarks, :text
    add_column :wx_pireps, :station, :text
  end
end
