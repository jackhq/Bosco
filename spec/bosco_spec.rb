require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Bosco::Main do
  
  before(:all) do
    @main = Bosco::Main.new(
      :form => { 
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

      },
      :output => %Q{
%p
  Hello \#{name}, thanks it will be awesome to see the \#{problems.to_sentence}      
}

    )
  
  end
  

  it "should be valid" do
    @main.should be_true
  end
  
  it "should implement form_build" do
    html = @main.build_form('/', 'post')
    
    html.should =~ /form/
    html.should =~ /div/
    
  end

  it "should implement output_build" do
    html = @main.build_output(
      :name => 'Tom', 
      :problems => %w{ pain nausea vomitting }
    )
    
    html.should =~ /<p>\nHello Tom, thanks it will be awesome to see the pain, nausea, and vomitting\n<\/p>/

  end
  
  
end
