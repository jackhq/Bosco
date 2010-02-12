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
    :output => @engine.build_output(params["fooform"])
  )
  
  # # Then we need to create a item record for each attribute
  @engine.form[:pages].each do |p|
    p[:questions].each do |q|
      value = nil
      if q[:type] == 'grid'
        value = []
        # Build Hash Array as value
        params["fooform"].each do |k, v|
          if k =~ /#{q[:name]}_(.*)/
            value << { k.split('_').pop => v}
          end
        end
        # We need to serialize by converting to json
        value = value.to_json
      else
        # Find name of result
        value = params["fooform"][q[:name].to_s]
      end
      ResultItem.create(
        :result_id => @result[:id],
        :name => q[:name],
        :value => value,
        :title => q[:title],
        :type => q[:type]       
      )
      
    end
  end

  haml :index
end

get "/form/:id/edit" do |id|
  @result = Result[id]
  
  @data = @result.get_data
  puts @data.inspect
  haml @engine.build_form('/form/update', 'post', @data)

end

# 
#   
#   haml params.inspect, :layout => x
#   
# end
# 
# get "/form/edit" do
# 
#   engine = Bosco::Engine.new(
#     :form => template["form"],
#     :output => template["output"],
#     :css => template["css"] || '',
#     :javascript => template["javascript"] || ''
#   )
#   haml engine.build_form('/form/output', 'post', 
#     :name => 'Tom', 
#     :address => '342 6th Avenue', 
#     :state => 'SC'), :layout => false
#   
#   
#   
# 
# end






