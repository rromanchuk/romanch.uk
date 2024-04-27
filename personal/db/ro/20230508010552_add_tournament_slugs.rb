class AddTournamentSlugs < ActiveRecord::Migration[7.0]
  def change
    add_column :tournaments, :slug, :string, index: { unique: true }
  end
end
