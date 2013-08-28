module SectionHelper
  require 'lib/section'
  
  def sections
    Section.all
  end
  
  def section_id(section)
    section.title.underscore.gsub(/[\s_]+/, '-')
  end
  
  def section_artifacts(section)
    if section.artifact_count > 0
      section.artifacts.map do |artifact|
        partial(:artifact_grid_item, locals: {artifact: artifact})
      end.join("\n")
    else
      ""
    end
  end
  
  def section_downloads(section)
    if section.download_count > 0
      section.downloads.map do |download|
        partial(:download_grid_item, locals: {download: download})
      end.join("\n")
    else
      ""
    end
  end
  
  
end