module Bosco 
  class Checkboxes < Bosco::Base
    
    attr_accessor :options
    
    def initialize(attributes=nil)
      super
      @options = attributes[:options] if attributes
    end
            
    def attributes
      super.merge(:options => @options)
    end
    
  end
  
end
