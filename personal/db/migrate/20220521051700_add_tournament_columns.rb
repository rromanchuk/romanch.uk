class AddTournamentColumns < ActiveRecord::Migration[7.0]
  def change
    add_column :romanchuk_open_tournaments, :title, :string
    add_column :romanchuk_open_tournaments, :data, :jsonb, null: false, default: {}
    add_column :romanchuk_open_tournaments, :ocurred_on, :datetime
  end
end
