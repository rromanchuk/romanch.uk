class RemoveDeadObjects < ActiveRecord::Migration[7.0]
  def change
    Image.destroy_all
    Video.destroy_all
  end
end
