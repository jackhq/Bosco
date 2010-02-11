require 'haml'

module Bosco end;

['base','text','paragraph', 'multiple_choice', 'checkboxes', 'list','scale'].each do |lib|
  require File.dirname(__FILE__) + '/bosco/' + lib
end