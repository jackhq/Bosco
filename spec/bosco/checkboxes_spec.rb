require File.dirname(__FILE__) + '/../spec_helper'

describe Bosco::Checkboxes do

  before(:all) do
    @checkboxes = Bosco::Checkboxes.new(
      :form => 'foo',
      :name => 'toys',
      :title => 'Favorite Toys',
      :help_text => 'Select your favorite toys',
      :required => false,
      :options => ['Legos', 'Ball', 'Robot', 'Dolls', 'Music Toys', 'Board Games']    
    )
  end
  

  it "should be valid" do
    Bosco::Checkboxes.new.should be_true
  end  
  
  it "should render checkboxes question" do
    @checkboxes.required = false
    @checkboxes.build.should == "<p>\n<label for='foo_toys'>Favorite Toys</label>\n<br />\n<div id='foo_toys'>\n<input id='foo_toys_legos' name='foo[toys]' type='checkbox' value='legos' />\n<label>Legos</label>\n<br />\n<input id='foo_toys_ball' name='foo[toys]' type='checkbox' value='ball' />\n<label>Ball</label>\n<br />\n<input id='foo_toys_robot' name='foo[toys]' type='checkbox' value='robot' />\n<label>Robot</label>\n<br />\n<input id='foo_toys_dolls' name='foo[toys]' type='checkbox' value='dolls' />\n<label>Dolls</label>\n<br />\n<input id='foo_toys_music toys' name='foo[toys]' type='checkbox' value='music toys' />\n<label>Music Toys</label>\n<br />\n<input id='foo_toys_board games' name='foo[toys]' type='checkbox' value='board games' />\n<label>Board Games</label>\n<br />\n</div>\n</p>\n"
  end

  it "should render required checkboxes question" do
    @checkboxes.required = true
    @checkboxes.build.should == "<p>\n<label class='required' for='foo_toys'>Favorite Toys</label>\n<br />\n<div data-required='true' id='foo_toys'>\n<input id='foo_toys_legos' name='foo[toys]' type='checkbox' value='legos' />\n<label>Legos</label>\n<br />\n<input id='foo_toys_ball' name='foo[toys]' type='checkbox' value='ball' />\n<label>Ball</label>\n<br />\n<input id='foo_toys_robot' name='foo[toys]' type='checkbox' value='robot' />\n<label>Robot</label>\n<br />\n<input id='foo_toys_dolls' name='foo[toys]' type='checkbox' value='dolls' />\n<label>Dolls</label>\n<br />\n<input id='foo_toys_music toys' name='foo[toys]' type='checkbox' value='music toys' />\n<label>Music Toys</label>\n<br />\n<input id='foo_toys_board games' name='foo[toys]' type='checkbox' value='board games' />\n<label>Board Games</label>\n<br />\n</div>\n</p>\n"    
  end
   
   
  it "should render checkboxes question with value" do
    @checkboxes.required = false
    @checkboxes.value = ['ball','robot']
    @checkboxes.build.should == "<p>\n<label for='foo_toys'>Favorite Toys</label>\n<br />\n<div id='foo_toys'>\n<input id='foo_toys_legos' name='foo[toys]' type='checkbox' value='legos' />\n<label>Legos</label>\n<br />\n<input checked='true' id='foo_toys_ball' name='foo[toys]' type='checkbox' value='ball' />\n<label>Ball</label>\n<br />\n<input checked='true' id='foo_toys_robot' name='foo[toys]' type='checkbox' value='robot' />\n<label>Robot</label>\n<br />\n<input id='foo_toys_dolls' name='foo[toys]' type='checkbox' value='dolls' />\n<label>Dolls</label>\n<br />\n<input id='foo_toys_music toys' name='foo[toys]' type='checkbox' value='music toys' />\n<label>Music Toys</label>\n<br />\n<input id='foo_toys_board games' name='foo[toys]' type='checkbox' value='board games' />\n<label>Board Games</label>\n<br />\n</div>\n</p>\n"    
 
  end
   
  
end