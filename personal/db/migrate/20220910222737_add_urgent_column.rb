class AddUrgentColumn < ActiveRecord::Migration[7.0]
  def change
    add_column :wx_pireps, :urgent, :boolean, default: false, indexed: true
  end
end
