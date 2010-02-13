require File.dirname(__FILE__) + '/../spec_helper'

describe Bosco::MultipleChoice do
  
  before(:all) do
    @choices = Bosco::MultipleChoice.new(
      :form => 'foo',
      :name => 'color',
      :title => 'Favorite Color',
      :help_text => 'Select your favorite color',
      :required => false,
      :options => ['Red', 'Green', 'Blue', 'Yellow']    
    ) 
  end
  

  it "should be valid" do
    Bosco::MultipleChoice.new.should be_true
  end
  
  
  it "should initialize attributes" do
        
    @choices.form.should == 'foo'
    @choices.name.should == 'color'
    @choices.title.should == 'Favorite Color'
    @choices.help_text.should == 'Select your favorite color'
    @choices.required.should == false
    @choices.options[0].should == 'Red'
    @choices.options[1].should == 'Green'
    @choices.options[2].should == 'Blue'
    @choices.options[3].should == 'Yellow'
  end
  
  it "should render multiple choice question" do
    @choices.required = false
    @choices.build.should == "<p>\n<label for='foo_color'>Favorite Color</label>\n<br />\n<div id='foo_color'>\n<input id='foo_color_red' name='foo[color]' type='radio' value='red' />\n<label>Red</label>\n<br />\n<input id='foo_color_green' name='foo[color]' type='radio' value='green' />\n<label>Green</label>\n<br />\n<input id='foo_color_blue' name='foo[color]' type='radio' value='blue' />\n<label>Blue</label>\n<br />\n<input id='foo_color_yellow' name='foo[color]' type='radio' value='yellow' />\n<label>Yellow</label>\n<br />\n</div>\n</p>\n"
  end

  it "should render required multiple choice question" do
    @choices.required = true
    @choices.build.should == "<p>\n<label class='required' for='foo_color'>Favorite Color</label>\n<br />\n<div data-required='true' id='foo_color'>\n<input id='foo_color_red' name='foo[color]' type='radio' value='red' />\n<label>Red</label>\n<br />\n<input id='foo_color_green' name='foo[color]' type='radio' value='green' />\n<label>Green</label>\n<br />\n<input id='foo_color_blue' name='foo[color]' type='radio' value='blue' />\n<label>Blue</label>\n<br />\n<input id='foo_color_yellow' name='foo[color]' type='radio' value='yellow' />\n<label>Yellow</label>\n<br />\n</div>\n</p>\n"
  end

  it "should render multiple choice question with value" do
    @choices.required = false
    @choices.value = 'red'
    @choices.build.should == "<p>\n<label for='foo_color'>Favorite Color</label>\n<br />\n<div id='foo_color'>\n<input checked='true' id='foo_color_red' name='foo[color]' type='radio' value='red' />\n<label>Red</label>\n<br />\n<input id='foo_color_green' name='foo[color]' type='radio' value='green' />\n<label>Green</label>\n<br />\n<input id='foo_color_blue' name='foo[color]' type='radio' value='blue' />\n<label>Blue</label>\n<br />\n<input id='foo_color_yellow' name='foo[color]' type='radio' value='yellow' />\n<label>Yellow</label>\n<br />\n</div>\n</p>\n"
  end

end