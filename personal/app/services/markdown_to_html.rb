class MarkdownToHtml < Service
  class CodeRayify < Redcarpet::Render::HTML
    def block_code(code, language)
      CodeRay.scan(code, language).div
    end
  end

  attr_reader :text
  def initialize(text)
    super()
    ap text
    @text = text
  end
  
  def call
    coderayified = CodeRayify.new(filter_html: true, hard_wrap: true)
 
    options = {
      fenced_code_blocks: true,
      no_intra_emphasis: true,
      autolink: true,
      lax_html_blocks: true
    }
 
    markdown_to_html = Redcarpet::Markdown.new(coderayified, options)
    markdown_to_html.render(text).html_safe
  end

end