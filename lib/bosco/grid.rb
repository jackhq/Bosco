module Bosco 
  class Grid < Bosco::Base
    
    attr_accessor :columns, :rows
    
    
    def initialize(attributes=nil)
      super
      @columns = attributes[:columns] if attributes
      @rows = attributes[:rows] if attributes
    end
        
    def build
      markup = open(File.dirname(__FILE__) + '/resources/grid.haml', 'r').read
      engine = Haml::Engine.new(markup, :ugly => true)
      engine.render Object.new, attributes
    end
    
    def attributes
      super.merge(
        :columns => @columns, 
        :rows => @rows
      )
    end
    
  end
  
end
