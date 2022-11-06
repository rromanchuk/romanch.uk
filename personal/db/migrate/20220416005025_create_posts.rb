class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'postgis'
    create_table :posts, id: :uuid do |t|
      t.string :title
      t.string :description
      t.text :body
      t.boolean :published

      t.timestamps
    end
  end
end
