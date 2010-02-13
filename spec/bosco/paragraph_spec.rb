require File.dirname(__FILE__) + '/../spec_helper'

describe Bosco::Paragraph do

  before(:all) do
    @paragraph = Bosco::Paragraph.new(
      :form => 'foo',
      :name => 'address',
      :title => 'Address',
      :help_text => 'Please enter your address',
      :required => false    
    )
  end

  it "should be valid" do
    Bosco::Paragraph.new.should be_true
  end
  
  
  it "should initialize attributes" do    
    @paragraph.form.should == 'foo'
    @paragraph.name.should == 'address'
    @paragraph.title.should == 'Address'
    @paragraph.help_text.should == 'Please enter your address'
    @paragraph.required.should == false
  end
  
  
  it "should render paragraph question with required false" do
    html = @paragraph.build
    html.should == "<p>\n<label for='foo_address'>Address</label>\n<br />\n<textarea data-required='false' id='foo_address' name='foo[address]'></textarea>\n</p>\n"
  end

  it "should render basic paragraph question with required true" do
    @paragraph.required = true
    html = @paragraph.build
    html.should == "<p>\n<label class='required' for='foo_address'>Address</label>\n<br />\n<textarea data-required='true' id='foo_address' name='foo[address]'></textarea>\n</p>\n"
    
  end

  it "should render paragraph question with value" do
    @paragraph.value = 'The little blue engine went, I think I can, I think I can!'
    html = @paragraph.build
    html.should == "<p>\n<label class='required' for='foo_address'>Address</label>\n<br />\n<textarea data-required='true' id='foo_address' name='foo[address]'>The little blue engine went, I think I can, I think I can!</textarea>\n</p>\n"
  end
  
  
end