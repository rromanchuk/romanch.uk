class CreateTables < ActiveRecord::Migration[7.0]
  def change
    create_table :players, id: :uuid do |t|
      t.string :name
      t.string :slug, unique: true, index: true
      t.jsonb :data, null: false, default: {}
      t.timestamps
    end

    create_table :golfers, id: :uuid do |t|
      t.belongs_to :player, type: :uuid
      t.belongs_to :tournament, type: :uuid
      t.jsonb :data, null: false, default: {}
      t.timestamps
    end

    create_table :tournaments, id: :uuid do |t|
      t.string :city
      t.string :country
      t.string :title
      t.date :ocurred_on
      t.jsonb :data, null: false, default: {}
      t.timestamps
    end
  end
end
