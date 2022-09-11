class AddGeoIndexes < ActiveRecord::Migration[7.0]
  def change
    add_index :wx_pireps, :location, using: :gist
    add_index :wx_aireps, :location, using: :gist
  end
end
