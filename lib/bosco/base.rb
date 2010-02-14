module Bosco 
  class Base
    
    attr_accessor :form, :name, :title, :help_text, :required, :value

    def initialize(attributes=nil)
      if attributes
        
        @form   = attributes[:form]
        @name   = attributes[:name]
        @title  = attributes[:title]
        @help_text = attributes[:help_text]
        @required = attributes[:required]
        @value = attributes[:value]
      end 
    end
    
    def build(data=nil)
      self.value = data[self.name.to_sym] if data && data[self.name.to_sym] 
      
      resource = self.class.to_s.underscore.split('/').pop
      markup = open(File.dirname(__FILE__) + "/resources/#{resource}.haml", 'r').read
      engine = Haml::Engine.new(markup, :ugly => true)
      engine.render Object.new, attributes
    end
    
    
    def attributes
      {
        :form => @form,
        :name => @name,
        :title => @title,
        :help_text => @help_text,
        :required => @required,
        :value => @value
      }
      
    end
    
  end
  
end
