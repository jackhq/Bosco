require File.dirname(__FILE__) + '/../spec_helper'

describe Bosco::Form do

  it "should be valid" do
    Bosco::Form.new.should be_true
  end
  
  
  it "should initialize attributes" do
    b = Bosco::Form.new(
      :form => 'myform',
      :name => 'myquestion',
      :title => 'mytitle',
      :help_text => 'myhelp',
      :required => false
      
    )
    
    b.form.should == 'myform'
    b.name.should == 'myquestion'
    b.title.should == 'mytitle'
    b.help_text.should == 'myhelp'
    b.required.should == false
    
  end
end