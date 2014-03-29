require 'active_support/all'

class BasicModel

  module InstanceMethods

    def attribute_names
      []
    end
    private :attribute_names

    def initialize(id, params={}, content=nil)
      @id = id
      @attrs = params.select{ |k,v| attribute_names.include?(k) }
      @content = content.split(/\n*[-]{3}\n/)[2]
    end
    
    attr_reader :id, :content

    def attrs
      HashWithIndifferentAccess.new @attrs
    end

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

  end # InstanceMethods

  module ClassMethods

    def load(slug)
      records[slug.to_sym] ||= begin
        contents = data_file(slug)
        new slug, YAML.load(contents), contents
      end
    end

    def data_file(slug)
      File.read( send("#{instance_name}_path", slug) )
    end

    def records
      @records ||= {}
    end
    
    def all
      Dir[path("*.#{extension}")].map do |path|
        name = File.basename(path)[/^(.*?)\.#{extension}/, 1]
        load(name)
      end
    end

    def extension(new_extension=nil)
      @extension = (new_extension || @extension) || 'yml'
    end
    
    def path(*parts)
      data_root.join(*parts)
    end

    def data_root
      Pathname.new File.join Middleman.locate_root, "data", instance_name.pluralize
    end
    
    def instance_name
      name.underscore
    end
    
    def method_missing(name, *args, &block)
      if name.to_s == "#{instance_name}_path"
        path("#{args[0]}.#{extension}")
      else
        super
      end
    end
  
  end #ClassMethods
  
  include InstanceMethods
  extend ClassMethods

end
