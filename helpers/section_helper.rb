module SectionHelper
  require 'lib/section'
  
  def sections
    Section.all.reject(&:empty?).sort(&section_order)
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

  private

  def order
    %w[
      evidence_based occupation_based leadership social_justice professional
      final_reflections
    ]
  end

  def section_order
    Proc.new { |s1, s2| order.index(s1.id) - order.index(s2.id) }
  end
  
  
end
