module SectionHelper
  require 'lib/section'
  
  def sections
    Section.all
  end
  
  def section_id(section)
    section.title.underscore.gsub(/[\s_]+/, '-')
  end
  
end