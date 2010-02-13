require File.dirname(__FILE__) + '/../spec_helper'

describe Bosco::Grid do
  before(:all) do
    @grid = Bosco::Grid.new(
      :form => 'foo',
      :name => 'problems',
      :title => 'Problems',
      :help_text => 'Enter your problems',
      :required => false,
      :columns => ['Y', 'N'],
      :rows => ['Pain', 'Nausea','Vomitting']      
    )
  end
  
  it "should be valid" do
    Bosco::Grid.new.should be_true
  end

  it "should render grid" do
    @grid.required = false
    @grid.build.should == "<p>\n<label for='foo_problems'>Problems</label>\n<br />\n<table border='0' cellpadding='0' cellspacing='0' id='foo_problems'>\n<tr>\n<td>&nbsp;</td>\n<td style='text-align:center'>Y</td>\n<td style='text-align:center'>N</td>\n</tr>\n<tr>\n<td style='border-top: 1px solid #333;'>Pain</td>\n<td style='border-top: 1px solid #333;'>\n<input id='foo_problems_pain_y' name='foo[problems][pain]' type='radio' value='y' />\n</td>\n<td style='border-top: 1px solid #333;'>\n<input id='foo_problems_pain_n' name='foo[problems][pain]' type='radio' value='n' />\n</td>\n</tr>\n<tr>\n<td style='border-top: 1px solid #333;'>Nausea</td>\n<td style='border-top: 1px solid #333;'>\n<input id='foo_problems_nausea_y' name='foo[problems][nausea]' type='radio' value='y' />\n</td>\n<td style='border-top: 1px solid #333;'>\n<input id='foo_problems_nausea_n' name='foo[problems][nausea]' type='radio' value='n' />\n</td>\n</tr>\n<tr>\n<td style='border-top: 1px solid #333;'>Vomitting</td>\n<td style='border-top: 1px solid #333;'>\n<input id='foo_problems_vomitting_y' name='foo[problems][vomitting]' type='radio' value='y' />\n</td>\n<td style='border-top: 1px solid #333;'>\n<input id='foo_problems_vomitting_n' name='foo[problems][vomitting]' type='radio' value='n' />\n</td>\n</tr>\n</table>\n</p>\n"
  end
  
  it "should render required grid" do
    @grid.required = true
    @grid.build.should == "<p>\n<label class='required' for='foo_problems'>Problems</label>\n<br />\n<table border='0' cellpadding='0' cellspacing='0' data-required='true' id='foo_problems'>\n<tr>\n<td>&nbsp;</td>\n<td style='text-align:center'>Y</td>\n<td style='text-align:center'>N</td>\n</tr>\n<tr>\n<td style='border-top: 1px solid #333;'>Pain</td>\n<td style='border-top: 1px solid #333;'>\n<input id='foo_problems_pain_y' name='foo[problems][pain]' type='radio' value='y' />\n</td>\n<td style='border-top: 1px solid #333;'>\n<input id='foo_problems_pain_n' name='foo[problems][pain]' type='radio' value='n' />\n</td>\n</tr>\n<tr>\n<td style='border-top: 1px solid #333;'>Nausea</td>\n<td style='border-top: 1px solid #333;'>\n<input id='foo_problems_nausea_y' name='foo[problems][nausea]' type='radio' value='y' />\n</td>\n<td style='border-top: 1px solid #333;'>\n<input id='foo_problems_nausea_n' name='foo[problems][nausea]' type='radio' value='n' />\n</td>\n</tr>\n<tr>\n<td style='border-top: 1px solid #333;'>Vomitting</td>\n<td style='border-top: 1px solid #333;'>\n<input id='foo_problems_vomitting_y' name='foo[problems][vomitting]' type='radio' value='y' />\n</td>\n<td style='border-top: 1px solid #333;'>\n<input id='foo_problems_vomitting_n' name='foo[problems][vomitting]' type='radio' value='n' />\n</td>\n</tr>\n</table>\n</p>\n"
    
  end
  
  it "should render grid with value" do
    @grid.required = false
    @grid.value = [{'pain' => 'n'}, {'nausea' => 'y'}, {'vomitting' => 'y'}]
    @grid.build.should == "<p>\n<label for='foo_problems'>Problems</label>\n<br />\n<table border='0' cellpadding='0' cellspacing='0' id='foo_problems'>\n<tr>\n<td>&nbsp;</td>\n<td style='text-align:center'>Y</td>\n<td style='text-align:center'>N</td>\n</tr>\n<tr>\n<td style='border-top: 1px solid #333;'>Pain</td>\n<td style='border-top: 1px solid #333;'>\n<input id='foo_problems_pain_y' name='foo[problems][pain]' type='radio' value='y' />\n</td>\n<td style='border-top: 1px solid #333;'>\n<input checked='checked' id='foo_problems_pain_n' name='foo[problems][pain]' type='radio' value='n' />\n</td>\n</tr>\n<tr>\n<td style='border-top: 1px solid #333;'>Nausea</td>\n<td style='border-top: 1px solid #333;'>\n<input checked='checked' id='foo_problems_nausea_y' name='foo[problems][nausea]' type='radio' value='y' />\n</td>\n<td style='border-top: 1px solid #333;'>\n<input id='foo_problems_nausea_n' name='foo[problems][nausea]' type='radio' value='n' />\n</td>\n</tr>\n<tr>\n<td style='border-top: 1px solid #333;'>Vomitting</td>\n<td style='border-top: 1px solid #333;'>\n<input checked='checked' id='foo_problems_vomitting_y' name='foo[problems][vomitting]' type='radio' value='y' />\n</td>\n<td style='border-top: 1px solid #333;'>\n<input id='foo_problems_vomitting_n' name='foo[problems][vomitting]' type='radio' value='n' />\n</td>\n</tr>\n</table>\n</p>\n"
    
  end
end