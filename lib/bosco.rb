require 'haml'

module Bosco end;

['base','text','paragraph'].each do |lib|
  require File.dirname(__FILE__) + '/bosco/' + lib
end