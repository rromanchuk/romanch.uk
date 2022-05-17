# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = 'https://romanch.uk'
SitemapGenerator::Sitemap.verbose = true
SitemapGenerator::Sitemap.compress = false
SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  Post.published.find_each do |post|
    add(post_path(post), lastmod: post.updated_at)
  end

  Image.find_each do |image|
    add(serve_image_path(image.slug), images: [{
          loc: image.key,
          caption: image.caption,
          geo_location: image.geo_location
        }], lastmod: image.updated_at)
  end
end
