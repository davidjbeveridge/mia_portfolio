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
    elsif artifact.video?
      video_embed(artifact, text)
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
    link_to image_path("artifacts/#{artifact.image}"), class: "image fancybox" do
      image_tag image_thumb_path(artifact.image)
    end
  end
  
  def video_embed(artifact, text=nil)
    content_tag :div, class: "video-wrapper" do
      tag :iframe,
          src: artifact.video,
          class: "video",
          frameborder: "0",
          allowfullscreen: true
    end
  end
  
  
  def pdf_thumb_path(pdf)
    basename = pdf.split('.').tap{|f|f.pop}.join('.')
    "thumbnails/#{basename}_350x.png"
  end
  
  def pdf_download_path(pdf)
    root_url "downloads/#{pdf}"
  end
  
  def image_thumb_path(img)
    basename = img.split('.').tap{|f|f.pop}.join('.')
    "thumbnails/#{basename}_350x.png"
  end
  
end
