$:.unshift '.'
require 'middleman-gh-pages'
require 'lib/gen_artifact'
require 'lib/pdf_thumbnailer'
require 'lib/image_thumbnailer'

namespace :generate do

  desc "Generate an artifact file"
  task :artifact do
    artifact_name = ENV['name']
    puts "Generating artifact: #{artifact_name}"
    GenArtifact.generate artifact_name
    puts "done."
  end
  
  desc "Generate thumbnails for PDF's"
  task :pdf_thumbs do
    puts "Building PDF thumbnails"
    PdfThumbnailer.generate
    puts "done."
  end
  
  desc "Generate thumbnails for images"
  task :image_thumbs do
    puts "Building image thumbnails"
    ImageThumbnailer.generate
    puts "done."
  end
  
  desc "Generate all thumbnails"
  task :thumbs => [:pdf_thumbs, :image_thumbs]

end

# task :build => 'generate:pdf_thumbs'
