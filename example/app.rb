require 'sinatra'
require 'haml'
require 'crack'

require File.dirname(__FILE__) + '/../lib/bosco'


get '/' do
  x = <<HAML

!!!
%html
  %head
    %title Bosco Example
  %body
    %h1 Bosco
    %p
      Welcome to the bosco example, bosco is an engine that will convert a template
      hash into a web form.  It offers css and javascript injection as well as output
      conversion.
      
    %form{:action => '/form/create', :method => 'post'}
      %p
        %label Form Template (JSON)
        %br
        %textarea{:style => 'height:250px;width:960px', :name => 'template'}
      %p
        %input{:type => 'submit'}
  
HAML
  haml x
end

post '/form/create' do

  x = <<HAML

!!!
%html
  %head
    %title Bosco Example
  %body
    %h1 Bosco
    %p
      Check out your new form!
    %hr
    
    = yield
  
HAML
  
  template = Crack::JSON.parse(params[:template])
  engine = Bosco::Main.new(
    :form => template["form"],
    :output => template["output"]
  )
  haml engine.build_form('/form/output', 'post'), :layout => x
  #haml template["form"].inspect, :layout => x
end

post "/form/output" do
    x = <<HAML

!!!
%html
  %head
    %title Bosco Example
  %body
    %h1 Bosco
    %p
      Check out your output!
    %hr

    = yield

HAML
  
  haml params.inspect, :layout => x
  
end



