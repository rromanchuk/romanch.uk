module VideosHelper
  def video_json_ld(video)
    Jbuilder.new do |json|
      json.ignore_nil!
      json.set! :@context, 'http://schema.org/'
      json.set! :@type, 'VideoObject'
      json.name video.title
      json.description video.description
      json.dateCreated video.created_at
      json.dateModified video.updated_at
      json.embedUrl serve_video_url(id: video.slug)
      json.conentUrl video.key
      json.thumbnailUrl video.thumbnail_key
    end
  end
end
