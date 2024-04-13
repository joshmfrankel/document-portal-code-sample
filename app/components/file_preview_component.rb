class FilePreviewComponent < ApplicationComponent
  def initialize(document:)
    @document = document
  end

  def markdown
    Redcarpet::Markdown.new(
      Redcarpet::Render::HTML,
      autolink: true,
      tables: true,
      fenced_code_blocks: true,
      strikethrough: true,
      superscript: true,
      underline: true,
      highlight: true,
      footnotes: true
    )
  end

  def content_type_category
    if @document.file.content_type.match?(/^image\//)
      :image
    elsif @document.file.content_type == "text/markdown"
      :markdown
    else
      :default
    end
  end
end
