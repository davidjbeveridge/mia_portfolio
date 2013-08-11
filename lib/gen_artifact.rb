require 'fileutils'

module GenArtifact
  extend FileUtils

  def generate(artifact_name=nil)
    if artifact_name and artifact_name.size > 0
      mkdir_p "data/artifacts"
      File.write( path(artifact_name), template )
    else
      useage
    end
  end

  protected
  def template
    <<-TEMPLATE
title: ""
summary: ""
text: >
TEMPLATE
  end

  def path(f)
    "data/artifacts/%s.yml" % f
  end

  def useage
    puts "usage: gen_artifact.rb <artifact name>"
    puts "                        *required"
  end

  module_function :generate, :template, :path, :useage

end
