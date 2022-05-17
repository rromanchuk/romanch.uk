# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = 'https://romanch.uk'
SitemapGenerator::Sitemap.verbose = true
SitemapGenerator::Sitemap.compress = false
SitemapGenerator::Sitemap.create do
  
  Post.published.find_each do |post|
    add(post_path(post), lastmod: post.updated_at, changefreq: :monthly, priority: 0.7)
  end

  Image.find_each do |image|
    add(serve_image_path(image.slug), images: [{
          loc: image.key,
          caption: image.caption,
          geo_location: image.geo_location
        }], lastmod: image.updated_at)
  end
end
