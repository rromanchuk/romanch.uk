# Set the host name for URL creation

SitemapGenerator::Sitemap.verbose = true
SitemapGenerator::Sitemap.compress = false
# SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'
SitemapGenerator::Sitemap.create(default_host: 'https://romanch.uk', sitemaps_path: 'sitemaps/romanchuk') do
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

SitemapGenerator::Sitemap.create(default_host: 'https://romanchukopen.com', sitemaps_path: 'sitemaps/romanchukopen') do
  RomanchukOpen::Tournament.find_each do |tournament|
    add(romanchuk_open_tournament_path(tournament), images: tournament.ro_photo_blobs.map do |blob|
                                                              { loc: blob.key }
                                                            end, lastmod: tournament.updated_at,
                                                    changefreq: :monthly, priority: 0.7)
  end
end
