module ArtifactHelper
  require 'lib/artifact'
  
  def artifact_url(artifact)
    url_for "artifacts/#{artifact.id}.html"
  end
  
  def artifact_content_url(artifact)
    url_for "artifacts/#{artifact.id}_content.html"
  end
  
  def thumbnail(artifact, text=nil)
    if artifact.pdf?
      pdf_thumbnail(artifact, text)
    elsif artifact.image?
      image_thumbnail(artifact, text)
    else
      content_tag :div, "No Image Available"
    end
  end
  
  def pdf_thumbnail(artifact, text=nil)
    link_to pdf_download_path(artifact.pdf) do
      content = image_tag pdf_thumb_path(artifact.pdf)
      content += content_tag(:div, text) if text
      content
    end
  end
  
  def image_thumbnail(artifact, text=nil)
    image_tag artifact.image
  end
  
  def pdf_thumb_path(pdf)
    basename = pdf.split('.').tap{|f|f.pop}.join('.')
    "thumbnails/#{basename}_350x.png"
  end
  
  def pdf_download_path(pdf)
    root_url "downloads/#{pdf}"
  end
  
  
end