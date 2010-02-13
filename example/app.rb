require 'sinatra'
require 'haml'
require 'crack'
require 'sequel'
require 'database'
require 'json'

require File.dirname(__FILE__) + '/../lib/bosco'


before do
  template = Crack::JSON.parse(open('form.json').read)
  @engine = Bosco::Engine.new(
    :form => template["form"],
    :output => template["output"],
    :css => template["css"] || '',
    :javascript => template["javascript"] || ''
  )
  
end

get '/' do
  haml @engine.build_form('/form/create', 'post')
  
   
end

post '/form/create' do
  # Need to create result record
  @result = Result.create(
    :template_name => 'form.json',
    :form_name => @engine.form[:name],
    :output => @engine.build_output(params["foo"])
  )
  
  @result.save_items(params["foo"], @engine.form)

  haml :index
end

get "/form/:id/edit" do |id|
  @result = Result[id]
  
  @data = @result.get_data
  puts @data.inspect
  haml @engine.build_form("/form/#{id}", 'post', @data)

end

post "/form/:id" do |id|
  @result = Result[id]
  @result.save_items(params["foo"], @engine.form)
  haml :index  
end





