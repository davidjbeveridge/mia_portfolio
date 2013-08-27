class Artifact < BasicModel
  
  def attribute_names
    %w(title category pdf image video summary text)
  end
  
  def download
    @attrs['download']
  end
  
end
