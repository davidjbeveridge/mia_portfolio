class Artifact < BasicModel
  
  def attribute_names
    %w(title category original download summary text)
  end
  
  def download
    @attrs['download']
  end
  
end
