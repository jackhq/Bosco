module Bosco 
  class Page < Bosco::Base
    attr_accessor :questions

    def initialize(attributes=nil)
      super
      @questions = attributes[:questions] if attributes
    end
      
    def build
      markup = open(File.dirname(__FILE__) + '/resources/page.haml', 'r').read
      engine = Haml::Engine.new(markup, :ugly => true)      
      
      engine.render Object.new, attributes do
        result = ''
        @questions.each do |q|
          q.merge!(:form => @form)
          if q[:type] == 'text'
            result += Bosco::Text.new(q).build
          elsif q[:type] == 'paragraph'
            result += Bosco::Paragraph.new(q).build
          elsif q[:type] == 'multiple_choice'
            result += Bosco::MultipleChoice.new(q).build
          elsif q[:type] == 'checkboxes'
            result += Bosco::Checkboxes.new(q).build
          elsif q[:type] == 'list'
            result += Bosco::List.new(q).build
          elsif q[:type] == 'scale'
            result += Bosco::Scale.new(q).build
          elsif q[:type] == 'grid'
            result += Bosco::Grid.new(q).build
          end
        end if @questions
        result
      end
    end
    
    def attributes
      super.merge(:questions => @questions)
    end
    
  end
  
end
