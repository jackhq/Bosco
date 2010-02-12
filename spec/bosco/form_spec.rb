require File.dirname(__FILE__) + '/../spec_helper'

describe Bosco::Form do

  it "should be valid" do
    Bosco::Form.new.should be_true
  end
  
  
  it "should initialize attributes" do
    b = Bosco::Form.new(
      :form => 'myform',
      :pages => [{
        :form => 'myform',
        :questions => [{
          :type => 'text',
          :form => 'myform',
          :name => 'mytext2',
          :title => 'SomeTitle',
          :help_text => 'Enter your Title.',
          :required => false 
          
          },
          {
          :type => 'text',
          :form => 'myform',
          :name => 'mytext3',
          :title => 'SomeTitle',
          :help_text => 'Enter your Title.',
          :required => false 
          }

          ]
      }],
      :form_method => '/',
      :form_action => 'post'      
    )
    
    b.form.should == 'myform'
    b.pages.should be_true
    b.form_method.should == '/'
    b.form_action.should == 'post'
    
  end
  
  it "should render from with page div" do
    html = Bosco::Form.new(
      :form => 'myform', 
      :form_action => '/', 
      :form_method => 'post',
      :pages => [{
        :form => 'myform',
        :questions => [{
          :type => 'text',
          :form => 'myform',
          :name => 'mytext2',
          :title => 'SomeTitle',
          :help_text => 'Enter your Title.',
          :required => false 
        },
        {
          :type => 'paragraph',
          :form => 'myform',
          :name => 'myparagraph',
          :title => 'Big Paragraph',
          :help_text => 'Sweet',
          :required => false 
        }]
      }]      
    ).build
    
    html.should =~ /form/
    html.should =~ /div/
    
    html.should =~ /input/
    
  end
  
end