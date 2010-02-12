require 'active_support'
module Bosco 
  class Output < Bosco::Base
    attr_accessor :output, :locals
    
    def initialize(attributes=nil)
      @output = attributes[:output] if attributes
      @locals = attributes[:locals] if attributes
    end
    
    def build
      engine = Haml::Engine.new(@output, :ugly => true)
      engine.render Object.new, @locals
    end
    
    
  end
  
end
