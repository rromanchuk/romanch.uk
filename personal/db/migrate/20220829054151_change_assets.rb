class ChangeAssets < ActiveRecord::Migration[7.0]
  def change
    Image.find_each do |image|
      asset = Asset.create!(key: image.key,
        slug: image.slug,
        tags_as_string: image.tags_as_string,
        title: image.title,
        description: image.caption,
        created_at: image.created_at,
        updated_at: image.updated_at,
        content_type: 'image/jpeg'
      )
      if image.imageable
        ap Attachment.create!(asset: asset, record: image.imageable, name: :ro_photo)
      end
    end

    Video.find_each do |video|
      ap Asset.create!(key: video.key,
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
