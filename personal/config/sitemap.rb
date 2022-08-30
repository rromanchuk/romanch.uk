# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = 'https://romanch.uk'
SitemapGenerator::Sitemap.verbose = true
SitemapGenerator::Sitemap.compress = false
SitemapGenerator::Sitemap.create do
  
  Post.published.find_each do |post|
    add(post_path(post), lastmod: post.updated_at, changefreq: :monthly, priority: 0.7)
  end

  Blob.find_each do |blob|
    next unless blob.image?
    
    add(serve_image_path(blob.slug), images: [{
          loc: blob.key,
          caption: blob.description,
          geo_location: blob.geo_location
        }], lastmod: blob.updated_at)
  end
end
