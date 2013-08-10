module ArtifactHelper
  require 'lib/artifact'
  
  def artifact_url(artifact)
    "artifacts/#{artifact.id}.html"
  end
  
  def artifact_content_url(artifact)
    "artifacts/#{artifact.id}_content.html"
  end
  
end