module Bosco 
  class Grid < Bosco::Base
    
    attr_accessor :columns, :rows
    
    
    def initialize(attributes=nil)
      super
      @columns = attributes[:columns] if attributes
      @rows = attributes[:rows] if attributes
    end
            
    def attributes
      super.merge(
        :columns => @columns, 
        :rows => @rows
      )
    end
    
  end
  
end
