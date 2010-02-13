require File.dirname(__FILE__) + '/../spec_helper'

describe Bosco::Scale do

  before(:all) do
    @scale = Bosco::Scale.new(
      :form => 'foo',
      :name => 'pain',
      :title => 'Pain',
      :help_text => 'Enter your pain score',
      :required => false,
      :start_value => 1,
      :stop_value => 10,
      :start_label => 'No Pain',
      :stop_label => 'Extreme Pain'
      
    )
  end
  
  it "should be valid" do
    Bosco::Scale.new.should be_true
  end
  
  it "should render scale" do
    @scale.required = false
    @scale.build.should == "<p>\n<label for='foo_pain'>Pain</label>\n<br />\n<table border='0' cellpadding='0' cellspacing='0' id='foo_pain'>\n<tr>\n<td>&nbsp;</td>\n<td style='text-align:center'>1</td>\n<td style='text-align:center'>2</td>\n<td style='text-align:center'>3</td>\n<td style='text-align:center'>4</td>\n<td style='text-align:center'>5</td>\n<td style='text-align:center'>6</td>\n<td style='text-align:center'>7</td>\n<td style='text-align:center'>8</td>\n<td style='text-align:center'>9</td>\n<td style='text-align:center'>10</td>\n<td>&nbsp;</td>\n</tr>\n<tr>\n<td style='border-top: 1px solid #333;border-bottom: 1px solid #333;'>No Pain</td>\n<td style='border-top: 1px solid #333;border-bottom: 1px solid #333;'>\n<input id='foo_pain_1' name='foo[pain]' type='radio' value='1' />\n</td>\n<td style='border-top: 1px solid #333;border-bottom: 1px solid #333;'>\n<input id='foo_pain_2' name='foo[pain]' type='radio' value='2' />\n</td>\n<td style='border-top: 1px solid #333;border-bottom: 1px solid #333;'>\n<input id='foo_pain_3' name='foo[pain]' type='radio' value='3' />\n</td>\n<td style='border-top: 1px solid #333;border-bottom: 1px solid #333;'>\n<input id='foo_pain_4' name='foo[pain]' type='radio' value='4' />\n</td>\n<td style='border-top: 1px solid #333;border-bottom: 1px solid #333;'>\n<input id='foo_pain_5' name='foo[pain]' type='radio' value='5' />\n</td>\n<td style='border-top: 1px solid #333;border-bottom: 1px solid #333;'>\n<input id='foo_pain_6' name='foo[pain]' type='radio' value='6' />\n</td>\n<td style='border-top: 1px solid #333;border-bottom: 1px solid #333;'>\n<input id='foo_pain_7' name='foo[pain]' type='radio' value='7' />\n</td>\n<td style='border-top: 1px solid #333;border-bottom: 1px solid #333;'>\n<input id='foo_pain_8' name='foo[pain]' type='radio' value='8' />\n</td>\n<td style='border-top: 1px solid #333;border-bottom: 1px solid #333;'>\n<input id='foo_pain_9' name='foo[pain]' type='radio' value='9' />\n</td>\n<td style='border-top: 1px solid #333;border-bottom: 1px solid #333;'>\n<input id='foo_pain_10' name='foo[pain]' type='radio' value='10' />\n</td>\n<td style='border-top: 1px solid #333;border-bottom: 1px solid #333;'>Extreme Pain</td>\n</tr>\n</table>\n</p>\n"
  end
  
  
  it "should render scale required" do
    @scale.required = true
    @scale.build.should == "<p>\n<label class='required' for='foo_pain'>Pain</label>\n<br />\n<table border='0' cellpadding='0' cellspacing='0' data-required='true' id='foo_pain'>\n<tr>\n<td>&nbsp;</td>\n<td style='text-align:center'>1</td>\n<td style='text-align:center'>2</td>\n<td style='text-align:center'>3</td>\n<td style='text-align:center'>4</td>\n<td style='text-align:center'>5</td>\n<td style='text-align:center'>6</td>\n<td style='text-align:center'>7</td>\n<td style='text-align:center'>8</td>\n<td style='text-align:center'>9</td>\n<td style='text-align:center'>10</td>\n<td>&nbsp;</td>\n</tr>\n<tr>\n<td style='border-top: 1px solid #333;border-bottom: 1px solid #333;'>No Pain</td>\n<td style='border-top: 1px solid #333;border-bottom: 1px solid #333;'>\n<input id='foo_pain_1' name='foo[pain]' type='radio' value='1' />\n</td>\n<td style='border-top: 1px solid #333;border-bottom: 1px solid #333;'>\n<input id='foo_pain_2' name='foo[pain]' type='radio' value='2' />\n</td>\n<td style='border-top: 1px solid #333;border-bottom: 1px solid #333;'>\n<input id='foo_pain_3' name='foo[pain]' type='radio' value='3' />\n</td>\n<td style='border-top: 1px solid #333;border-bottom: 1px solid #333;'>\n<input id='foo_pain_4' name='foo[pain]' type='radio' value='4' />\n</td>\n<td style='border-top: 1px solid #333;border-bottom: 1px solid #333;'>\n<input id='foo_pain_5' name='foo[pain]' type='radio' value='5' />\n</td>\n<td style='border-top: 1px solid #333;border-bottom: 1px solid #333;'>\n<input id='foo_pain_6' name='foo[pain]' type='radio' value='6' />\n</td>\n<td style='border-top: 1px solid #333;border-bottom: 1px solid #333;'>\n<input id='foo_pain_7' name='foo[pain]' type='radio' value='7' />\n</td>\n<td style='border-top: 1px solid #333;border-bottom: 1px solid #333;'>\n<input id='foo_pain_8' name='foo[pain]' type='radio' value='8' />\n</td>\n<td style='border-top: 1px solid #333;border-bottom: 1px solid #333;'>\n<input id='foo_pain_9' name='foo[pain]' type='radio' value='9' />\n</td>\n<td style='border-top: 1px solid #333;border-bottom: 1px solid #333;'>\n<input id='foo_pain_10' name='foo[pain]' type='radio' value='10' />\n</td>\n<td style='border-top: 1px solid #333;border-bottom: 1px solid #333;'>Extreme Pain</td>\n</tr>\n</table>\n</p>\n"
  end
  
  it "should render scale with value" do
    @scale.required = false
    @scale.value = 4
    @scale.build.should == "<p>\n<label for='foo_pain'>Pain</label>\n<br />\n<table border='0' cellpadding='0' cellspacing='0' id='foo_pain'>\n<tr>\n<td>&nbsp;</td>\n<td style='text-align:center'>1</td>\n<td style='text-align:center'>2</td>\n<td style='text-align:center'>3</td>\n<td style='text-align:center'>4</td>\n<td style='text-align:center'>5</td>\n<td style='text-align:center'>6</td>\n<td style='text-align:center'>7</td>\n<td style='text-align:center'>8</td>\n<td style='text-align:center'>9</td>\n<td style='text-align:center'>10</td>\n<td>&nbsp;</td>\n</tr>\n<tr>\n<td style='border-top: 1px solid #333;border-bottom: 1px solid #333;'>No Pain</td>\n<td style='border-top: 1px solid #333;border-bottom: 1px solid #333;'>\n<input id='foo_pain_1' name='foo[pain]' type='radio' value='1' />\n</td>\n<td style='border-top: 1px solid #333;border-bottom: 1px solid #333;'>\n<input id='foo_pain_2' name='foo[pain]' type='radio' value='2' />\n</td>\n<td style='border-top: 1px solid #333;border-bottom: 1px solid #333;'>\n<input id='foo_pain_3' name='foo[pain]' type='radio' value='3' />\n</td>\n<td style='border-top: 1px solid #333;border-bottom: 1px solid #333;'>\n<input checked='true' id='foo_pain_4' name='foo[pain]' type='radio' value='4' />\n</td>\n<td style='border-top: 1px solid #333;border-bottom: 1px solid #333;'>\n<input id='foo_pain_5' name='foo[pain]' type='radio' value='5' />\n</td>\n<td style='border-top: 1px solid #333;border-bottom: 1px solid #333;'>\n<input id='foo_pain_6' name='foo[pain]' type='radio' value='6' />\n</td>\n<td style='border-top: 1px solid #333;border-bottom: 1px solid #333;'>\n<input id='foo_pain_7' name='foo[pain]' type='radio' value='7' />\n</td>\n<td style='border-top: 1px solid #333;border-bottom: 1px solid #333;'>\n<input id='foo_pain_8' name='foo[pain]' type='radio' value='8' />\n</td>\n<td style='border-top: 1px solid #333;border-bottom: 1px solid #333;'>\n<input id='foo_pain_9' name='foo[pain]' type='radio' value='9' />\n</td>\n<td style='border-top: 1px solid #333;border-bottom: 1px solid #333;'>\n<input id='foo_pain_10' name='foo[pain]' type='radio' value='10' />\n</td>\n<td style='border-top: 1px solid #333;border-bottom: 1px solid #333;'>Extreme Pain</td>\n</tr>\n</table>\n</p>\n"
    
  end
end