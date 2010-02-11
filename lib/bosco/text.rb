module Bosco 
  class Text < Bosco::Base
        
    def build
      markup = open(File.dirname(__FILE__) + '/resources/text.haml', 'r').read
      engine = Haml::Engine.new(markup, :ugly => true)
      engine.render Object.new, attributes
    end
  end
  
end
