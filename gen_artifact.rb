#!/usr/bin/env ruby

root = "data/artifacts/%s.yml"
artifact_name = ARGV[0]

template =<<-TEMPLATE
title: ""
summary: ""
text: >
  
TEMPLATE

begin
  require 'fileutils'
rescue LoadError => e
  require 'ftools'
end


if artifact_name and artifact_name.size > 0
  FileUtils.mkdir_p "data/artifacts"
  File.open(root % artifact_name, 'w') do |file|
    file.write( template )
  end
else
  puts "usage: gen_artifact.rb <artifact name>"
  puts "                        *required"
end