require 'kramdown'

class Artifact < BasicModel

  extension 'markdown'

  def attribute_names
    %w[title category pdf image video summary children]
  end

  def download
    attrs[:download]
  end

  def text
    attrs[:text] || content
  end

  def content
    Kramdown::Document.new(super).to_html
  end

end
