require File.dirname(__FILE__) + '/../spec_helper'

describe Bosco::Output do

  it "should be valid" do
    Bosco::Output.new.should be_true
  end
  
  
  it "should initialize attributes" do
    markup = %Q{
%p
  Hello \#{name}, thanks it will be awesome to see the \#{problems.to_sentence}
}

    html = Bosco::Output.new(
      :output => markup, 
      :locals => {
        :name => 'Tom', 
        :problems => %w{ pain nausea vomitting }
      }
    ).build
    
    html.should =~ /<p>\nHello Tom, thanks it will be awesome to see the pain, nausea, and vomitting\n<\/p>/
    
  end
  

end