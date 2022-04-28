class CreateVideos2 < ActiveRecord::Migration[7.0]
  def change
    add_column :videos, :slug, :string
    add_index :videos, :slug, unique: true
    Video.create(key: 'avx/master.m3u8', aspect: '9:16')
    Video.create(key: 'l35/master.m3u8', aspect: '16:9')
  end
end
