require 'sinatra'
require 'haml'
require 'crack'
require 'bosco'

class App < Sinatra::Default

  get '/' do
    haml :index
  end
  
  get '/hpi' do
    template = Crack::JSON.parse(open('hpi.json').read)
    haml @engine = Bosco::Engine.new(
      :form => template["form"],
      :output => template["output"],
      :css => template["css"] || '',
      :javascript => template["javascript"] || ''
    ).build_form
    
  end
  
  post '/hpi/create' do
    template = Crack::JSON.parse(open('hpi.json').read)
    @engine = Bosco::Engine.new(
      :form => template["form"],
      :output => template["output"],
      :css => template["css"] || '',
      :javascript => template["javascript"] || ''
    )
    
    haml @engine.build_output(params['hpi'])
  end
  
  
  get '/mse' do
    template = Crack::JSON.parse(open('mse.json').read)
    haml @engine = Bosco::Engine.new(
      :form => template["form"],
      :output => template["output"],
      :css => template["css"] || '',
      :javascript => template["javascript"] || ''
    ).build_form
    
  end

  get '/bhx' do
    template = Crack::JSON.parse(open('bhx.json').read)
    haml @engine = Bosco::Engine.new(
      :form => template["form"],
      :output => template["output"],
      :css => template["css"] || '',
      :javascript => template["javascript"] || ''
    ).build_form
    
  end
  
  get '/fra' do
    template = Crack::JSON.parse(open('fra.json').read)
    haml @engine = Bosco::Engine.new(
      :form => template["form"],
      :output => template["output"],
      :css => template["css"] || '',
      :javascript => template["javascript"] || ''
    ).build_form
    
  end
  
  
  

end
