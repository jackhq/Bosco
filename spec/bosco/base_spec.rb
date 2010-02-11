require File.dirname(__FILE__) + '/../spec_helper'

describe Bosco::Base do
  
  it "should be valid" do
    Bosco::Base.new.should be_true
  end
  
  
  it "should initialize attributes" do
    b = Bosco::Base.new(
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
  
  it "should return a hash array of all attributes" do
    b = Bosco::Base.new(
      :form => 'myform',
      :name => 'myquestion',
      :title => 'mytitle',
      :help_text => 'myhelp',
      :required => false
      
    )

    b.attributes[:form].should == 'myform'
    b.attributes[:name].should == 'myquestion'
    b.attributes[:title].should == 'mytitle'
    b.attributes[:help_text].should == 'myhelp'
    b.attributes[:required].should == false

  end
  
  
  
end