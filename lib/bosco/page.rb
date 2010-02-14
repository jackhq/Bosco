module Bosco 
  class Page < Bosco::Base
    attr_accessor :questions
    
    
    def initialize(attributes=nil)
      super      
      @questions = []
      attributes[:questions].each do |q|
        @questions << eval(['Bosco',q[:type].camelize].join('::')).new(q.merge(:form => self.form))
      end if attributes && attributes[:questions]
    end
      
    def build(data=nil)
      markup = open(File.dirname(__FILE__) + '/resources/page.haml', 'r').read
      engine = Haml::Engine.new(markup, :ugly => true)      
      
      engine.render Object.new, attributes do
        result = ''
        @questions.each do |q|
          result += q.build(data)
        end if @questions
        result
      end
    end
    
    def attributes
      super.merge(:questions => @questions)
    end
    
  end
  
end
