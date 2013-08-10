module ArtifactHelper
  require 'lib/artifact'
  
  def artifact_url(artifact)
    url_for "artifacts/#{artifact.id}.html"
  end
  
  def artifact_content_url(artifact)
    url_for "artifacts/#{artifact.id}_content.html"
  end
  
end