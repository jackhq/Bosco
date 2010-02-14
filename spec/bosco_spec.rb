require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Bosco::Engine do
  
  before(:all) do
    css = <<CSS
p { margin:0;padding:0;font-size:1.25em; }
CSS

    javascript = <<JAVASCRIPT
$(function(){
  $('form').submit(function(){
    alert('need to add validations');
  });
});        
JAVASCRIPT

    @main = Bosco::Engine.new(
      :form => { 
        :name => 'myform', 
        :action => '/', 
        :method => 'post',
        :pages => [{
          :questions => [{
            :type => 'text',
            :name => 'mytext2',
            :title => 'SomeTitle',
            :help_text => 'Enter your Title.',
            :required => true 
          },
          {
            :type => 'paragraph',
            :name => 'myparagraph',
            :title => 'Big Paragraph',
            :help_text => 'Sweet',
            :required => true 
          }]
        }]

      },
      :output => %Q{
%p
  Hello \#{name}, thanks it will be awesome to see the \#{problems.to_sentence}      
},
      :css => css,
      :javascript => javascript
      )
  
  end
  

  it "should be valid" do
    @main.should be_true
  end
  
  it "should implement form_build" do
    html = @main.build_form('/', 'post')
    #puts html
    
    html.should =~ /form/
    html.should =~ /div/
    html.should =~ /label/
    html.should =~ /input/
    
    
  end

  it "should implement output_build" do
    html = @main.build_output(
      :name => 'Tom', 
      :problems => %w{ pain nausea vomitting }
    )
    
    html.should =~ /<p>\nHello Tom, thanks it will be awesome to see the pain, nausea, and vomitting\n<\/p>/

  end
  

  it "should implement form_build" do
    data = {:mytext2 => "Hello World", :myparagraph => "Good bye World"}
    html = @main.build_form('/', 'post', data)
    #puts html
    
    html.should =~ /form/
    html.should =~ /div/
    html.should =~ /label/
    html.should =~ /input(.*)value='Hello World'/
    html.should =~ /textarea(.*)Good bye World(.*)textarea/
    
    #puts html
    
  end

  it "should implement is_valid?" do
    @main.form.is_valid?("mytext2" => "Hello World").should be_false
    @main.form.errors.count.should == 1
    @main.form.errors[0].should == "Big Paragraph is required."
    
  end
  
  
  
end
