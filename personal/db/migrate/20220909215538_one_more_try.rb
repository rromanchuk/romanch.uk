class OneMoreTry < ActiveRecord::Migration[7.0]
  def change
    drop_table :aircraft_type_designators
    create_table :aircraft_type_designators, id: :uuid do |t|
      t.text :icao_code, null: false, indexed: true, unique: true
      t.text :aircraft_class

      t.integer :number_of_engines
      t.text :engine_type
      t.text :weight_class

      t.text :icao_wtc
      t.text :recat
      t.text :recat_wtc_a
      t.text :recat_wtc_b
      t.text :cwtc
      t.text :srs
      t.text :lahso
      t.text :manufacturer
      t.text :model
      t.jsonb :data, null: false, default: {}
      t.text :slug, indexed: true
      t.timestamps
    end
  end
end
