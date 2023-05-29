class CreateImages < ActiveRecord::Migration[7.0]
  def change
    create_table :images, id: :uuid do |t|
      t.references :tournament, null: false, foreign_key: true, type: :uuid
      t.timestamps
    end
  end
end
