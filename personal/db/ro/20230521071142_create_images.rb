class CreateImages < ActiveRecord::Migration[7.0]
  def change
    create_table :images, id: :uuid do |t|
      t.references :tournament, type: :uuid, index: true
      t.jsonb :meta
      t.timestamps
    end
  end
end
