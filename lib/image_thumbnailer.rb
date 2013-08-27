require 'fileutils'

module ImageThumbnailer
  module_function
  
  def generate
    mkdir_p thumb_path
    
    images.each do |image|
      print "#{image.name}..."
      dimensions.each do |dim|
        system "convert -resize #{dim} #{image.fullpath} #{output_file(image.name, dim)}"
      end
      print "ok.\n"
    end
  end
  
  def images
    Dir["#{artifact_path}/*.{jpg,png,gif}"].map{|f| file_info(f) }
  end
  
  def artifact_path
    "source/images/artifacts"
  end
  
  def thumb_path(f=nil)
    if f.nil?
      "source/images/thumbnails"
    else
      "source/images/thumbnails/#{f}"
    end
  end
  
  def thumb_name(image, dim)
    base = image.split('.').tap{ |exts| exts.pop }.join('.')
    "#{base}_#{dim}.png"
  end
  
  def output_file(name, dim)
    thumb_path(thumb_name(name, dim))
  end
  
  
  def file_info(file)
    OpenStruct.new name: File.basename(file), fullpath: file
  end
  
  def dimensions
    ['350x']
  end
  
  
  extend FileUtils
  
end