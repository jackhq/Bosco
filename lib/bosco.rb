require 'haml'


%w{ base text paragraph multiple_choice checkboxes list scale grid section page form output }.each do |lib|
  require File.dirname(__FILE__) + '/bosco/' + lib
end

module Bosco 

  class << self
    attr_accessor :template
    
    def initialize(attributes=nil)
      @template = attributes[:template]
    end
    
    def build_form(method, action)
      Bosco::Form.new(@template[:form].merge(:form_method => method, :form_action => action)).build
    end
    
    def build_output(locals=nil)
      Bosco::Output.new(@template[:output], locals).build
    end
    
  end

end