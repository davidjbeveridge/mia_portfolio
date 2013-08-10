module SectionHelper
  require 'lib/section'
  
  def sections
    Section.all
  end
  
  def section_id(section)
    section.title.underscore.gsub(/[\s_]+/, '-')
  end
  
  def section_href(section, include_root=false)
    if include_root
      '/#'+section_id(section)
    else
      "#"+section_id(section)
    end
  end
  
end