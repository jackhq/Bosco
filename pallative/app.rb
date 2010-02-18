require 'sinatra'
require 'haml'
require 'crack'
require 'bosco'

class App < Sinatra::Default

  get '/' do
    haml :index
  end
  
  get '/palliative' do
    haml bosco('palliative').build_form
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
