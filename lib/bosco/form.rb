module Bosco 
  class Form < Bosco::Base
    attr_accessor :pages, :form_action, :form_method
    
    def initialize(attributes=nil)
      super
      @pages = attributes[:pages] if attributes
      @form_action = attributes[:form_action] if attributes
      @form_method = attributes[:form_method] if attributes

    end
        
    def build
      markup = open(File.dirname(__FILE__) + '/resources/form.haml', 'r').read
      engine = Haml::Engine.new(markup, :ugly => true)
      engine.render Object.new, attributes do
        result = ''
        @pages.each do |p|
          result += Bosco::Page.new(p.merge(:form => @name)).build
        end if @pages
        result += Bosco::Button.new(:title => 'submit').build
        result
      end
      
    end
    
    def attributes
      super.merge(:pages => @pages, :form_action => @form_action, :form_method => @form_method)
    end
    
  end
  
end
