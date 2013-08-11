module SiteHelper
  def site_title
    "Mia Beveridge"
  end
  
  def header(title=nil)
    partial :header, locals: {title: title || site_title}
  end
  
  def root_url(path=nil)
    relative_root = ('../' * current_path.scan('/').count)
    relative_root + (path || 'index.html')
  end
  
end