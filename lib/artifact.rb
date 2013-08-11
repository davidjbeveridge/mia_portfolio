class Artifact < BasicModel
  
  def attribute_names
    %w(title category pdf image summary text)
  end
  
  def download
    @attrs['download']
  end
  
end
