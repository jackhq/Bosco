module Bosco 
  class Base
    
    attr_accessor :form, :name, :title, :help_text, :required

    def initialize(attributes=nil)
      if attributes
        
        @form   = attributes[:form]
        @name   = attributes[:name]
        @title  = attributes[:title]
        @help_text = attributes[:help_text]
        @required = attributes[:required]
      end 
    end
    
    def attributes
      {
        :form => @form,
        :name => @name,
        :title => @title,
        :help_text => @help_text,
        :required => @required
      }
      
    end
    
  end
  
end
