require File.dirname(__FILE__) + '/../spec_helper'

describe Bosco::MultipleChoice do

  it "should be valid" do
    Bosco::MultipleChoice.new.should be_true
  end
  
  
  it "should initialize attributes" do
    b = Bosco::MultipleChoice.new(
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
     html = Bosco::MultipleChoice.new(
       :form => 'myform1',
       :name => 'mytext',
       :title => 'Name',
       :help_text => 'Enter your Name.',
       :required => false,
       :options => ['Option 1', 'Option 2']
     ).build
 
     html.should =~ /<p>/
     html.should =~ /<label for='myform1_mytext'>Name<\/label>/
     html.should =~ /<br \/>/
     html.should =~ /input/
     html.should =~ /type='radio'/   
     html.should =~ /id='myform1_mytext'/
     html.should =~ /name='myform1\[mytext\]'/
     html.should =~ /value='Option 1'/
     html.should =~ /<label>Option 1<\/label>/

     html.should =~ /input/
     html.should =~ /type='radio'/   
     html.should =~ /id='myform1_mytext'/
     html.should =~ /name='myform1\[mytext\]'/
     html.should =~ /value='Option 2'/
     html.should =~ /<label>Option 2<\/label>/

     html.should =~ /<\/p>/
  end

  it "should render basic text question in html" do
     html = Bosco::MultipleChoice.new(
       :form => 'myform1',
       :name => 'mytext',
       :title => 'Name',
       :help_text => 'Enter your Name.',
       :required => false,
       :options => ['Option 1', 'Option 2'],
       :value => 'Option 1'
     ).build
 
     html.should =~ /<p>/
     html.should =~ /<label for='myform1_mytext'>Name<\/label>/
     html.should =~ /<br \/>/
     html.should =~ /input/
     html.should =~ /type='radio'/   
     html.should =~ /id='myform1_mytext'/
     html.should =~ /name='myform1\[mytext\]'/
     html.should =~ /checked='true'(.*)value='Option 1'/
     html.should =~ /<label>Option 1<\/label>/

     html.should =~ /input/
     html.should =~ /type='radio'/   
     html.should =~ /id='myform1_mytext'/
     html.should =~ /name='myform1\[mytext\]'/
     html.should =~ /value='Option 2'/
     html.should =~ /<label>Option 2<\/label>/

     html.should =~ /<\/p>/
     
     #puts html
  end

  # 
  # it "should render basic text question in html" do
  #   html = Bosco::MultipleChoice.new(
  #     :form => 'myform2',
  #     :name => 'mytext2',
  #     :title => 'SomeTitle',
  #     :help_text => 'Enter your Title.',
  #     :required => false
  #   ).build
  #   
  #   html.should =~ /<p>/
  #   html.should =~ /<label for='myform2_mytext2'>SomeTitle<\/label>/
  #   html.should =~ /<br \/>/
  #   html.should =~ /textarea/
  #   html.should =~ /id='myform2_mytext2'/
  #   html.should =~ /name='myform2\[mytext2\]'/
  #   html.should =~ /<\/p>/
  #   
  # end
  # 
  
end