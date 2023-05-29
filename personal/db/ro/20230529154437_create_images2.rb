class CreateImages2 < ActiveRecord::Migration[7.0]
  def change
    drop_table :images
    create_table :images, id: :uuid do |t|
      t.references :tournament, type: :uuid, index: true
      t.jsonb :meta
      t.timestamps
    end
  end
end
