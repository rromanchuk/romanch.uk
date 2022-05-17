module PostsHelper
  def json_ld(post)
    JSON.pretty_generate(
      { "@context": 'https://schema.org',
        "@type": 'Article',
        "headline": post.title,
        "author": 'Ryan Romanchuk',
        "keywords": post.tags_as_string,
        "dateCreated": post.created_at,
        "dateModified": post.updated_at,
        "description": post.description }.compact
    )
  end
end
