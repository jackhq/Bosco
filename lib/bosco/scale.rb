module Bosco 
  class Scale < Bosco::Base
    
    attr_accessor :start_value, :stop_value, :start_label, :stop_label
    
    
    def initialize(attributes=nil)
      super
      @start_value = attributes[:start_value] if attributes
      @start_label = attributes[:start_label] if attributes
      @stop_value = attributes[:stop_value] if attributes
      @stop_label = attributes[:stop_label] if attributes
    end
        
    def build
      markup = open(File.dirname(__FILE__) + '/resources/scale.haml', 'r').read
      engine = Haml::Engine.new(markup, :ugly => true)
      engine.render Object.new, attributes
    end
    
    def attributes
      super.merge(
        :start_value => @start_value, 
        :stop_value => @stop_value, 
        :start_label => @start_label, 
        :stop_label => @stop_label
      )
    end
    
  end
  
end
