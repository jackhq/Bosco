require 'haml'


%w{ base text paragraph multiple_choice checkboxes list scale grid section page form output }.each do |lib|
  require File.dirname(__FILE__) + '/bosco/' + lib
end

module Bosco 

  class Main
    attr_accessor :form, :output, :css, :javascript
  
    def initialize(attributes=nil)
      @form = attributes[:form] if attributes
      @output = attributes[:output] if attributes
      @css = attributes[:css] if attributes && attributes[:css]
      @javascript = attributes[:javascript] if attributes && attributes[:javascript]

    end
  
    def build_form(method, action)
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