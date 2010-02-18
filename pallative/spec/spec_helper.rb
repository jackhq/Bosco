require File.expand_path(File.dirname(__FILE__) + "/../app")
Bundler.require_env(:test)    # get rspec and webrat in here


# require 'rubygems'
# require 'sinatra'
require 'rack/test'
require 'spec'
require 'spec/autorun'
require 'spec/interop/test'
require 'webrat'

# set test environment
set :environment, :test
set :run, false
set :raise_errors, true
set :logging, false