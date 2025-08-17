class CreateStreamingVideos < ActiveRecord::Migration[7.1]
  def change
    create_table :streaming_videos, id: :uuid do |t|
      t.string :key, null: false
      t.string :content_type
      t.string :title
      t.string :description
      t.string :slug, index: { unique: true }
      t.jsonb :data, null: false, default: {}
      t.timestamps
    end
  end
end
