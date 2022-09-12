# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = 'https://romanch.uk'
SitemapGenerator::Sitemap.verbose = true
SitemapGenerator::Sitemap.compress = false
SitemapGenerator::Sitemap.create do
  Post.published.find_each do |post|
    add(post_path(post), lastmod: post.updated_at, changefreq: :monthly, priority: 0.7)
  end

  Blob.images.find_each do |blob|
    add(serve_image_path(blob.slug), images: [{
          loc: blob.key
        }], lastmod: blob.updated_at)
  end

  Blob.videos.find_each do |blob|
    add(serve_video_path(blob.slug), video: {
          title: blob.title,
          description: blob.description,
          thumbnail_loc: blob.thumbnail_key,
          content_loc: blob.key,
          publication_date: blob.created_at.to_s,
          live: false,
          tags: blob.tag_names
        }, lastmod: blob.updated_at)
  end
end
