require 'sinatra'
require 'haml'
require 'bosco'
require 'crack'
require 'json'

class App < Sinatra::Default

  enable :sessions
  
  get '/' do
    session[:forms] = [] unless session[:forms]
    haml :index
  end
  
  get '/forms/new' do
    haml :new_bosco_form
  end
  
  post '/forms' do
    session[:forms] << { :name => params[:form][:name]}.to_json
    redirect '/'
  end
  
  get '/forms/:name' do |name|
    
  end
  
  
  
  
  get '/questions/new' do
    template = Crack::JSON.parse(open('question.json').read)
    haml @engine = Bosco::Engine.new(
      :form => template["form"],
      :output => template["output"],
      :css => template["css"] || '',
      :javascript => template["javascript"] || ''
    ).build_form
  end
  
  post '/questions' do
    
    #session[:form] << params[:question].to_json
    haml :show, :locals =>  { :question => params[:question].to_json }
    
  end
  
  

end
