class AddContentColumnsToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :html_content, :text
    add_column :posts, :markdown_content, :text
  end
end
