require File.dirname(__FILE__) + '/../spec_helper'

describe Bosco::Text do
  
  before(:all) do
    @bosco = Bosco::Text.new(
      :form => 'foo',
      :name => 'name',
      :title => 'Name',
      :help_text => 'Please enter name',
      :required => false
    )
  end
  

  it "should be valid" do
    Bosco::Text.new.should be_true
  end
  
  
  it "should initialize attributes" do    
    @bosco.form.should == 'foo'
    @bosco.name.should == 'name'
    @bosco.title.should == 'Name'
    @bosco.help_text.should == 'Please enter name'
    @bosco.required.should == false
    
  end
  
  
  it "should render basic text question that is required in html" do
    @bosco.required = true
    html = @bosco.build
    html.should == "<p>\n<label class='required' for='foo_name'>Name</label>\n<br />\n<input data-required='true' id='foo_name' name='foo[name]' type='text' />\n</p>\n"
  end

  it "should render text question that is not required in html" do
    @bosco.required = false
    html = @bosco.build
    html.should == "<p>\n<label for='foo_name'>Name</label>\n<br />\n<input data-required='false' id='foo_name' name='foo[name]' type='text' />\n</p>\n"
        
  end
  
  it "should render basic text question in html" do
    @bosco.required = true
    @bosco.value = 'Trey Wilson'
    html = @bosco.build
    html.should == "<p>\n<label class='required' for='foo_name'>Name</label>\n<br />\n<input data-required='true' id='foo_name' name='foo[name]' type='text' value='Trey Wilson' />\n</p>\n"
  end
  
  
  
end