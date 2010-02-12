require File.dirname(__FILE__) + '/../spec_helper'

describe Bosco::Text do

  it "should be valid" do
    Bosco::Text.new.should be_true
  end
  
  
  it "should initialize attributes" do
    b = Bosco::Text.new(
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
  
  
  it "should render basic text question in html" do
    html = Bosco::Text.new(
      :form => 'myform1',
      :name => 'mytext',
      :title => 'Name',
      :help_text => 'Enter your Name.',
      :required => true
    ).build
    
    html.should =~ /<p>/
    html.should =~ /<label for='myform1_mytext'>Name<\/label>/
    html.should =~ /<br \/>/
    html.should =~ /input/
    html.should =~ /type='text'/
    html.should =~ /id='myform1_mytext'/
    html.should =~ /name='myform1\[mytext\]'/
    html.should =~ /data-required='true'/

    html.should =~ /<\/p>/
  end

  it "should render basic text question in html" do
    html = Bosco::Text.new(
      :form => 'myform2',
      :name => 'mytext2',
      :title => 'SomeTitle',
      :help_text => 'Enter your Title.',
      :required => false
    ).build
    
    html.should =~ /<p>/
    html.should =~ /<label for='myform2_mytext2'>SomeTitle<\/label>/
    html.should =~ /<br \/>/
    html.should =~ /input/
    html.should =~ /type='text'/
    html.should =~ /id='myform2_mytext2'/
    html.should =~ /name='myform2\[mytext2\]'/
    html.should =~ /data-required='false'/

    html.should =~ /<\/p>/
    
  end
  
  
end