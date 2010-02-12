require 'haml'
require File.dirname(__FILE__) + '/string_to_keys'

Dir.glob(File.dirname(__FILE__) + '/bosco/**/*.rb').each do |lib|
  require lib
end

module Bosco 

  class Engine
    attr_accessor :form, :output, :css, :javascript
  
    def initialize(attributes=nil)
      @form = attributes[:form].key_strings_to_symbols! if attributes
      @output = attributes[:output] if attributes
      @css = attributes[:css] if attributes && attributes[:css]
      @javascript = attributes[:javascript] if attributes && attributes[:javascript]

    end
  
    def build_form(action, method, data=nil)
      # if data, set value node to each question.
      add_values_to_questions(data) if data
      
      result = ''
      result += "<style type='text/css'>#{@css}</style>\n" if @css
      result += "<script type='text/javascript'>#{@javascript}</script>\n" if @javascript
      result += Bosco::Form.new(@form.merge(:form_method => method, :form_action => action)).build
      result
    end
  
    def build_output(locals=nil)
      Bosco::Output.new(:output => @output, :locals => locals).build
    end
        
    def add_values_to_questions(data)
      @form[:pages].each do |p|
        p[:questions].each do |q|
          q.merge!(:value => data[q[:name].to_sym])
        end
      end
    end
    
  end

end