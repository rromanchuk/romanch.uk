class CreateRomanchukOpenTournaments < ActiveRecord::Migration[7.0]
  def change
    create_table :romanchuk_open_tournaments, id: :uuid do |t|
      t.string :city
      t.string :country

      t.timestamps
    end
  end
end
