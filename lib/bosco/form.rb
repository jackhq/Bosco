module Bosco 
  class Form < Bosco::Base
    attr_accessor :pages, :form_action, :form_method, :button, :errors
    
    def initialize(attributes=nil)
      super
      @errors = []
      @pages = []
      attributes[:pages].each do |p|
        @pages << Bosco::Page.new(p.merge(:form => self.name))
      end if attributes
      @button = Bosco::Button.new(:title => 'submit')
      @form_action = attributes[:action] if attributes
      @form_method = attributes[:method] if attributes


    end
        
    def build(data=nil)
      markup = open(File.dirname(__FILE__) + '/resources/form.haml', 'r').read
      engine = Haml::Engine.new(markup, :ugly => true)
      engine.render Object.new, attributes do
        result = ''
        pages.each do |p|
          result += p.build(data)
        end if pages
        result += button.build
        result
      end
      
    end
    
    def attributes
      super.merge(:pages => @pages, :form_action => @form_action, :form_method => @form_method, :errors => @errors)
    end
    
    def is_valid?(data)
      result = true
      pages.each do |p|
        p.questions.each do |q|
          if (data[q.name].nil? or data[q.name].empty?) and q.required
            result = false 
            @errors << "#{q.title} is required."
          end
        end
      end
      result
    end
    
  end
  
end
