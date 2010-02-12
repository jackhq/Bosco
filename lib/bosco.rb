require 'haml'
require File.dirname(__FILE__) + '/string_to_keys'

Dir.glob(File.dirname(__FILE__) + '/bosco/**/*.rb').each do |lib|
  require lib
end

module Bosco 

  class Main
    attr_accessor :form, :output, :css, :javascript
  
    def initialize(attributes=nil)
      @form = attributes[:form].key_strings_to_symbols! if attributes
      puts @form.inspect
      @output = attributes[:output] if attributes
      @css = attributes[:css] if attributes && attributes[:css]
      @javascript = attributes[:javascript] if attributes && attributes[:javascript]

    end
  
    def build_form(action, method)
      result = ''
      result += "<style type='text/css'>#{@css}</style>\n" if @css
      result += "<script type='text/javascript'>#{@javascript}</javascript>\n" if @javascript
      result += Bosco::Form.new(@form.merge(:form_method => method, :form_action => action)).build
      result
    end
  
    def build_output(locals=nil)
      Bosco::Output.new(:output => @output, :locals => locals).build
    end
        
  
  end

end