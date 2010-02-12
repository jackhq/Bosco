require File.dirname(__FILE__) + '/../spec_helper'

describe Bosco::Grid do

  it "should be valid" do
    Bosco::Grid.new.should be_true
  end

  it "should initialize attributes" do
    b = Bosco::Grid.new(
      :form => 'myform',
      :name => 'myquestion',
      :title => 'mytitle',
      :help_text => 'myhelp',
      :required => false,
      :columns => ['Y', 'N'],
      :rows => ['Pain', 'Nausea','Vomitting']      
    )
    
    b.form.should == 'myform'
    b.name.should == 'myquestion'
    b.title.should == 'mytitle'
    b.help_text.should == 'myhelp'
    b.required.should == false
    b.columns[0].should == 'Y'
    b.columns[1].should == 'N'
    
    b.rows[0].should == 'Pain'
    b.rows[1].should == 'Nausea'
    b.rows[2].should == 'Vomitting'
    
    
    
    
  end
  # 
  # 
  it "should render basic text question in html" do
     html = Bosco::Grid.new(
       :form => 'myform1',
       :name => 'mytext',
       :title => 'Name',
       :help_text => 'Enter your Name.',
       :required => false,
       :columns => ['Y', 'N'],
       :rows => ['Pain', 'Nausea','Vomitting']
       
     ).build
   
     html.should =~ /<p>/
     html.should =~ /<label for='myform1_mytext'>Name<\/label>/
     html.should =~ /<br \/>/
     html.should =~ /<label>Pain<\/label>/
     html.should =~ /<input id='myform1_mytext_Pain' name='myform1\[mytext_Pain\]' type='radio' value='Y' \/>/
     html.should =~ /<label>Y<\/label>/    
     html.should =~ /<input id='myform1_mytext_Pain' name='myform1\[mytext_Pain\]' type='radio' value='N' \/>/
     html.should =~ /<label>N<\/label>/    
     html.should =~ /<label>Nausea<\/label>/
     html.should =~ /<input id='myform1_mytext_Nausea' name='myform1\[mytext_Nausea\]' type='radio' value='Y' \/>/
     html.should =~ /<label>Y<\/label>/    
     html.should =~ /<input id='myform1_mytext_Nausea' name='myform1\[mytext_Nausea\]' type='radio' value='N' \/>/
     html.should =~ /<label>N<\/label>/    
    
     html.should =~ /<\/p>/
   
  end
  

  it "should render basic text question in html" do
     html = Bosco::Grid.new(
       :form => 'myform1',
       :name => 'mytext',
       :title => 'Name',
       :help_text => 'Enter your Name.',
       :required => false,
       :columns => ['Y', 'N'],
       :rows => ['Pain', 'Nausea','Vomitting'],
       :value => [{'Pain' => 'N'}, {'Nausea' => 'Y'}, {'Vomitting' => 'N'}]      
  
       
     ).build
   
     html.should =~ /<p>/
     html.should =~ /<label for='myform1_mytext'>Name<\/label>/
     html.should =~ /<br \/>/
     html.should =~ /<label>Pain<\/label>/
     html.should =~ /<input id='myform1_mytext_Pain' name='myform1\[mytext_Pain\]' type='radio' value='Y' \/>/
     html.should =~ /<label>Y<\/label>/    
     html.should =~ /<input(.*)id='myform1_mytext_Pain'(.*)name='myform1\[mytext_Pain\]'(.*)selected='true'(.*)type='radio' value='N' \/>/
     html.should =~ /<label>N<\/label>/    
     html.should =~ /<label>Nausea<\/label>/
     html.should =~ /<input id='myform1_mytext_Nausea'(.*)name='myform1\[mytext_Nausea\]'(.*)selected='true'(.*)type='radio' value='Y' \/>/
     html.should =~ /<label>Y<\/label>/    
     html.should =~ /<input id='myform1_mytext_Nausea' name='myform1\[mytext_Nausea\]' type='radio' value='N' \/>/
     html.should =~ /<label>N<\/label>/    
     html.should =~ /<input id='myform1_mytext_Vomitting'(.*)name='myform1\[mytext_Vomitting\]'(.*)type='radio' value='Y' \/>/
     html.should =~ /<label>Y<\/label>/    
     html.should =~ /<input(.*)id='myform1_mytext_Vomitting'(.*)name='myform1\[mytext_Vomitting\]'(.*)selected='true'(.*)type='radio' value='N' \/>/
     html.should =~ /<label>N<\/label>/    
    
     html.should =~ /<\/p>/
   
  end

  
end