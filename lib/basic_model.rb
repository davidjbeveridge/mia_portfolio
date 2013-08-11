class BasicModel
  
  def attribute_names
    []
  end
  private :attribute_names

  def initialize(id, params={})
    @id = id
    @attrs = params.select{ |k,v| attribute_names.include?(k) }
  end
  
  attr_reader :id

  def method_missing(name, *args)
    name = name.to_s
    if attribute_names.include? name
      @attrs[name]
    elsif attribute_names.include? name[0...-1]
      if name[-1] == '='
        @attrs[name[0...-1]] = args[0]
      elsif name[-1] == '?'
        !@attrs[name[0...-1]].nil?
      end
    else
      p name, args
      super
    end
  end

  def to_s
    kv_pairs = @attrs.map{|k,v| "@#{k}: #{v}"}.join(', ')
    "<#{self.class.name}\##{object_id} #{kv_pairs} >"
  end
  
  
  def self.load(slug)
    @records ||= {}
    @records[slug.to_sym] ||= begin
      yaml = File.read( send("#{instance_name}_path", slug) )
      new slug, YAML.load(yaml)
    end
  end
  
  def self.all
    Dir[path("*.yml")].map do |path|
      name = File.basename(path)[/^(.*?).yml/, 1]
      load(name)
    end
  end
  
  def self.path(*args)
    [Middleman.locate_root, "data", instance_name.pluralize, *args].join('/')
  end
  
  def self.instance_name
    self.name.underscore
  end
  
  def self.method_missing(name, *args, &block)
    path_method = "#{instance_name}_path"
    if name.to_s == "#{path_method}"
      path("#{args[0]}.yml")
    else
      super
    end
  end
  

end