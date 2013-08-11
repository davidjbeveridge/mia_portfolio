$:.unshift '.'
require 'middleman-gh-pages'
require 'lib/gen_artifact'
require 'lib/pdf_thumbnailer'

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

end

task :build => 'generate:pdf_thumbs'
