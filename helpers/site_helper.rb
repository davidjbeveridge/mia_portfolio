module SiteHelper
  def site_title
    "Mia Beveridge"
  end
  
  def header(title=nil)
    partial :header, locals: {title: title || site_title}
  end
  
  def root_url
    ('../' * current_path.scan('/').count) + 'index.html'
  end
  
end