require File.dirname(__FILE__) + '/../spec_helper'

describe Bosco::List do

  it "should be valid" do
    Bosco::List.new.should be_true
  end
  
  
  it "should initialize attributes" do
    b = Bosco::List.new(
      :form => 'myform',
      :name => 'myquestion',
      :title => 'mytitle',
      :help_text => 'myhelp',
      :required => false,
      :options => ['Option 1', 'Option 2']
      
    )
    
    b.form.should == 'myform'
    b.name.should == 'myquestion'
    b.title.should == 'mytitle'
    b.help_text.should == 'myhelp'
    b.required.should == false
    b.options[0].should == 'Option 1'
    b.options[1].should == 'Option 2'
    
    
  end
  
  
  it "should render basic text question in html" do
     html = Bosco::List.new(
       :form => 'myform1',
       :name => 'mytext',
       :title => 'Name',
       :help_text => 'Enter your Name.',
       :required => false,
       :options => ['List 1', 'List 2']
     ).build
 
     html.should =~ /<p>/
     html.should =~ /<label for='myform1_mytext'>Name<\/label>/
     html.should =~ /<br \/>/
     html.should =~ /select id='myform1_mytext'/
     html.should =~ /<option value='List 1'>List 1<\/option>/
     html.should =~ /<option value='List 2'>List 2<\/option>/

     html.should =~ /<\/p>/
 
  end

  
end