require File.dirname(__FILE__) + '/../spec_helper'

describe Bosco::Scale do

  it "should be valid" do
    Bosco::Scale.new.should be_true
  end
  
  
  it "should initialize attributes" do
    b = Bosco::Scale.new(
      :form => 'myform',
      :name => 'myquestion',
      :title => 'mytitle',
      :help_text => 'myhelp',
      :required => false,
      :start_value => 1,
      :stop_value => 5,
      :start_label => 'Min',
      :stop_label => 'Max'
      
    )
    
    b.form.should == 'myform'
    b.name.should == 'myquestion'
    b.title.should == 'mytitle'
    b.help_text.should == 'myhelp'
    b.required.should == false
    b.start_value.should == 1
    b.stop_value.should == 5
    b.start_label.should == 'Min'
    b.stop_label.should == 'Max'
    
    
    
  end
  
  
  it "should render basic text question in html" do
     html = Bosco::Scale.new(
       :form => 'myform1',
       :name => 'mytext',
       :title => 'Name',
       :help_text => 'Enter your Name.',
       :required => false,
       :start_value => 1,
       :stop_value => 5,
       :start_label => 'Min',
       :stop_label => 'Max'

       
     ).build
   
     html.should =~ /<p>/
     html.should =~ /<label for='myform1_mytext'>Name<\/label>/
     html.should =~ /<br \/>/
     html.should =~ /<label>Min<\/label>/
     html.should =~ /<input id='myform1_mytext' name='myform1\[mytext\]' type='radio' value='1' \/>/
     html.should =~ /<label>1<\/label>/    
     html.should =~ /<input id='myform1_mytext' name='myform1\[mytext\]' type='radio' value='2' \/>/
     html.should =~ /<label>2<\/label>/    
     html.should =~ /<input id='myform1_mytext' name='myform1\[mytext\]' type='radio' value='3' \/>/
     html.should =~ /<label>3<\/label>/    
     html.should =~ /<input id='myform1_mytext' name='myform1\[mytext\]' type='radio' value='4' \/>/
     html.should =~ /<label>4<\/label>/    
     html.should =~ /<input id='myform1_mytext' name='myform1\[mytext\]' type='radio' value='5' \/>/
     html.should =~ /<label>5<\/label>/    

     html.should =~ /<label>Max<\/label>/
  
     html.should =~ /<\/p>/
        
  end

  it "should render basic text question in html" do
     html = Bosco::Scale.new(
       :form => 'myform1',
       :name => 'mytext',
       :title => 'Name',
       :help_text => 'Enter your Name.',
       :required => false,
       :start_value => 3,
       :stop_value => 8,
       :start_label => 'Start',
       :stop_label => 'Finish'

       
     ).build
   
     html.should =~ /<p>/
     html.should =~ /<label for='myform1_mytext'>Name<\/label>/
     html.should =~ /<br \/>/
     html.should =~ /<label>Start<\/label>/
     html.should =~ /<input id='myform1_mytext' name='myform1\[mytext\]' type='radio' value='3' \/>/
     html.should =~ /<label>3<\/label>/    
     html.should =~ /<input id='myform1_mytext' name='myform1\[mytext\]' type='radio' value='4' \/>/
     html.should =~ /<label>4<\/label>/    
     html.should =~ /<input id='myform1_mytext' name='myform1\[mytext\]' type='radio' value='5' \/>/
     html.should =~ /<label>5<\/label>/    
     html.should =~ /<input id='myform1_mytext' name='myform1\[mytext\]' type='radio' value='6' \/>/
     html.should =~ /<label>6<\/label>/    
     html.should =~ /<input id='myform1_mytext' name='myform1\[mytext\]' type='radio' value='7' \/>/
     html.should =~ /<label>7<\/label>/    
     html.should =~ /<input id='myform1_mytext' name='myform1\[mytext\]' type='radio' value='8' \/>/
     html.should =~ /<label>8<\/label>/    

     html.should =~ /<label>Finish<\/label>/
  
     html.should =~ /<\/p>/
   
  end

  
end