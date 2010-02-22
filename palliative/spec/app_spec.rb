require 'spec_helper'

describe 'app root' do
  include Rack::Test::Methods

  def app
    App
  end
  
  it 'should contain welcome' do
    get '/'
    last_response.body.should =~ /Welcome/
  end
  
  
end
