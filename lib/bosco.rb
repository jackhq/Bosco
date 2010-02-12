require 'haml'


%w{ base text paragraph multiple_choice checkboxes list scale grid section page form output }.each do |lib|
  require File.dirname(__FILE__) + '/bosco/' + lib
end

module Bosco 

  class Main
    attr_accessor :form, :output
  
    def initialize(attributes=nil)
      @form = attributes[:form] if attributes
      @output = attributes[:output] if attributes

    end
  
    def build_form(method, action)
      Bosco::Form.new(@form.merge(:form_method => method, :form_action => action)).build
    end
  
    def build_output(locals=nil)
      Bosco::Output.new(:output => @output, :locals => locals).build
    end
  
  end

end