class Section < BasicModel

  def attribute_names
    %w(title artifacts downloads)
  end
  
  def artifacts
    @cached_artifacts ||= ( @attrs['artifacts'] || [] ).map { |slug| Artifact.load(slug) }
  end

  def downloads
    @cached_downloads ||= ( @attrs['downloads'] || [] )
  end

  
  def artifact_count
    (@attrs['artifacts'] || []).count
  end
  
  def download_count
    (@attrs['downloads'] || []).count
  end

  def empty?
    artifact_count == 0 and download_count == 0
  end

  def any?
    !empty?
  end
  
end
