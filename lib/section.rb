class Section < BasicModel

  def attribute_names
    %w(title artifacts)
  end
  
  def artifacts
    @cached_artifacts ||= ( @attrs['artifacts'] || [] ).map { |slug| Artifact.load(slug) }
  end
  
  def artifact_count
    (@attrs['artifacts'] || []).count
  end
  
end