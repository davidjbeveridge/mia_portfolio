require 'kramdown'

class Artifact < BasicModel

  extension 'markdown'

  def attribute_names
    %w[title category pdf image video summary children caption]
  end

  def download
    attrs[:download]
  end

  def text
    attrs[:text] || content
  end

  def content
    kramdown super
  end

  def kramdown(text)
    Kramdown::Document.new(text).to_html
  end

  def has_attachment?
    pdf? or image? or video?
  end

end
