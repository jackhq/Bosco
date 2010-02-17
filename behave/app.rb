require 'sinatra'
require 'haml'
require 'crack'
require 'bosco'

class App < Sinatra::Default

  get '/' do
    haml :index
  end
  
  get '/hpi' do
    haml bosco('hpi').build_form    
  end
  
  post '/hpi/create' do    
    haml bosco('hpi').build_output(params['hpi'])
  end
  
  get '/mse' do
    haml bosco('mse').build_form
  end

  get '/bhx' do
    haml bosco('bhx').build_form
  end
  
  get '/fra' do
    haml bosco('fra').build_form
  end
  
  get '/ia' do
    haml bosco('ia').build_form
  end
  
  get '/ag' do
    haml bosco('ag').build_form
  end
  
  get '/pra' do
    haml bosco('pra').build_form
  end
  
  get '/clinical' do
    haml bosco('clinical').build_form
  end
  
  
  def bosco(name)
    template = Crack::JSON.parse(open(name + '.json').read)    
    @engine = Bosco::Engine.new(
      :form => template["form"],
      :output => template["output"],
      :css => template["css"] || '',
      :javascript => template["javascript"] || ''
    )
    
  end
  
  

end
