module Bosco 
  class Page < Bosco::Base
        
    def build
      markup = open(File.dirname(__FILE__) + '/resources/section.haml', 'r').read
      engine = Haml::Engine.new(markup, :ugly => true)
      engine.render Object.new, attributes
    end
  end
  
end
