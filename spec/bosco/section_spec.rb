require File.dirname(__FILE__) + '/../spec_helper'

describe Bosco::Section do

  it "should be valid" do
    Bosco::Section.new.should be_true
  end
  
  
  it "should initialize attributes" do
    b = Bosco::Section.new(
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
  
  
  it "should render basic section question in html" do
    html = Bosco::Section.new(
      :form => 'myform1',
      :name => 'mytext',
      :title => 'Name',
      :help_text => 'Enter your Name.',
      :required => false
    ).build
    
    html.should =~ /<h3>Name<\/h3>/
    html.should =~ /<p>\nEnter your Name.\n<\/p>/
  end


  
end