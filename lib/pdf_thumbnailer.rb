require 'fileutils'

module PdfThumbnailer
  module_function
  
  def generate
    mkdir_p thumb_path
    
    pdfs.each do |pdf|
      print "#{pdf.name}..."
      dimensions.each do |dim|
        system "convert -resize #{dim} #{pdf.fullpath}[0] #{output_file(pdf.name, dim)}"
      end
      print "ok.\n"
    end
  end
  
  def pdfs
    Dir["#{download_path}/**/*.pdf"].map{|f| file_info(f) }
  end
  
  def download_path
    "source/downloads"
  end
  
  def thumb_path(f=nil)
    if f.nil?
      "source/images/thumbnails"
    else
      "source/images/thumbnails/#{f}"
    end
  end
  
  def thumb_name(pdf, dim)
    base = pdf.split('.').tap{ |exts| exts.pop }.join('.')
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