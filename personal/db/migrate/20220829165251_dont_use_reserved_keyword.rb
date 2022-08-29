class DontUseReservedKeyword < ActiveRecord::Migration[7.0]
  def change
    drop_table :assets
    drop_table :attachments

    create_table :blobs, id: :uuid do |t|
      t.string :key, indexed: true, null: false, unique: true
      t.string :slug, indexed: true, unique: true
      t.jsonb :data, null: false, default: {}
      t.string :content_type
      t.string :title
      t.string :description
      t.timestamps
    end

    create_table :attachments, id: :uuid do |t|
      t.references :blob, null: false, type: :uuid
      t.references :record, null: false, polymorphic: true, index: false, type: :uuid
      t.string :name, null: false
      t.timestamps
      t.index [:record_type, :record_id, :name, :blob_id], name: "index_attachments_uniqueness", unique: true
    end

    Image.find_each do |image|
      blob = Blob.create!(key: image.key,
        slug: image.slug,
        tags_as_string: image.tags_as_string,
        title: image.title,
        description: image.caption,
        created_at: image.created_at,
        updated_at: image.updated_at,
        content_type: 'image/jpeg'
      )
      if image.imageable
        ap Attachment.create!(blob: blob, record: image.imageable, name: :ro_photo)
      end
    end

    Video.find_each do |video|
      ap Blob.create!(key: video.key,
        slug: video.slug,
        tags_as_string: video.tags_as_string,
        title: video.title,
        description: video.description,
        created_at: video.created_at,
        updated_at: video.updated_at,
        content_type: 'application/vnd.apple.mpegurl',
        aspect: video.aspect,
        thumbnail_key: video.thumbnail_key
      )
    end
  end
end
