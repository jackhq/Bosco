require 'haml'
require File.dirname(__FILE__) + '/string_to_keys'

Dir.glob(File.dirname(__FILE__) + '/bosco/**/*.rb').each do |lib|
  require lib
end

module Bosco 

  class Engine
    attr_accessor :form, :output, :css, :javascript
  
    def initialize(attributes=nil)
      @form = Bosco::Form.new(attributes[:form].key_strings_to_symbols!) if attributes
      
      @output = attributes[:output] if attributes
      @css = attributes[:css] if attributes && attributes[:css]
      @javascript = attributes[:javascript] if attributes && attributes[:javascript]

    end
  
    def build_form(action=nil, method=nil, data=nil)
      @form.form_action = action if method      
      @form.form_method = method if method
      
      result = ''
      result += "<style type='text/css'>#{@css}</style>\n" if @css
      result += "<script type='text/javascript'>#{@javascript}</script>\n" if @javascript
      result += form.build(data)
      result
    end
  
    def build_output(locals=nil)
      Bosco::Output.new(:output => @output, :locals => locals).build
    end
        
            
  end

end