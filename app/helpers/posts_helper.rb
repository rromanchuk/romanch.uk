module PostsHelper
  def post_json_ld(post)
    Jbuilder.new do |json|
      json.ignore_nil!
      json.set! :@context, 'http://schema.org/'
      json.set! :@type, 'Article'
      json.headline post.title
      json.description post.description
      json.keywords post.tags_as_string
      json.dateCreated post.created_at
      json.dateModified post.updated_at
    end
  end
end
