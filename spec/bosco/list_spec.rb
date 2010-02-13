require File.dirname(__FILE__) + '/../spec_helper'

describe Bosco::List do
  
  before(:all) do
    @list = Bosco::List.new(
      :form => 'foo',
      :name => 'season',
      :title => 'Favorite Season',
      :help_text => 'Select your favorite season',
      :required => false,
      :options => ['Spring', 'Summer', 'Fall','Winter']
      
    )
  end
  

  it "should be valid" do
    Bosco::List.new.should be_true
  end
  
  it "should render list" do
    @list.required = false
    @list.build.should == "<p>\n<label for='foo_season'>Favorite Season</label>\n<br />\n<select id='foo_season' name='foo[season]'>\n<option value='spring'>Spring</option>\n<option value='summer'>Summer</option>\n<option value='fall'>Fall</option>\n<option value='winter'>Winter</option>\n</select>\n</p>\n"
  end
  
  
  it "should render required list" do
    @list.required = true
    @list.build.should == "<p>\n<label class='required' for='foo_season'>Favorite Season</label>\n<br />\n<select data-required='true' id='foo_season' name='foo[season]'>\n<option value='spring'>Spring</option>\n<option value='summer'>Summer</option>\n<option value='fall'>Fall</option>\n<option value='winter'>Winter</option>\n</select>\n</p>\n"
  end
  
  it "should render list with summer selected" do
    @list.required = false
    @list.value = 'summer'
    @list.build.should == "<p>\n<label for='foo_season'>Favorite Season</label>\n<br />\n<select id='foo_season' name='foo[season]'>\n<option value='spring'>Spring</option>\n<option selected='true' value='summer'>Summer</option>\n<option value='fall'>Fall</option>\n<option value='winter'>Winter</option>\n</select>\n</p>\n"
  end

  
end