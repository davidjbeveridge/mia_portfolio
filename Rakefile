$:.unshift '.'
require 'middleman-gh-pages'
require 'lib/gen_artifact'

namespace :generate do

  desc "Generate an artifact file"
  task :artifact do
    artifact_name = ENV['name']
    puts "Generating artifact: #{artifact_name}"
    GenArtifact.generate artifact_name
    puts "done."
  end

end
