module Bosco 
  class MultipleChoice < Bosco::Base
    
    attr_accessor :options
    
    def initialize(attributes=nil)
      super
      @options = attributes[:options] if attributes
    end
        
    def build
      markup = open(File.dirname(__FILE__) + '/resources/multiple_choice.haml', 'r').read
      engine = Haml::Engine.new(markup, :ugly => true)
      engine.render Object.new, attributes
    end
    
    def attributes
      super.merge(:options => @options)
    end
    
  end
  
end
