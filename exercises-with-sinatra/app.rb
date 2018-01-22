require 'sinatra'
set :session_secret, 'here be dragons'
set :bind, '0.0.0.0'
set :port, 4568

get '/' do
  erb :index
end

get '/secret' do
  'this is a secret page'
end

get '/hello/:name/:surname' do
  # matches "GET /hello/foo" and "GET /hello/bar"
  # params['name'] is 'foo' or 'bar'
  "Hello #{params['name']}  #{params[:surname]}!"
end

get '/brilliant-form' do
  p params
  @name = params[:name]
  erb :brilliant_form
end

post '/brilliant' do
  p params
  @name = params[:name]
  erb :brilliant_result
end

get '/say/*/to/*' do
  # matches /say/hello/to/world
  params['splat'][0] + ' ' + params['splat'][1] + '!' # => ["hello", "world"]
end

get '/download/*.*' do
  # matches /download/path/to/file.xml
  params['splat'] # => ["path/to/file", "xml"]
end

get '/random-rocky' do
  @name = %w[Rocky Topolone Cuddly].sample
  erb :rocky_result
end

get '/rocky-form' do
  p params
  @name = params[:name]
  @colour = params[:colour]
  erb :rocky_form
end

post '/named-rocky' do
  p params
  @name = params[:name]
  @colour = params[:colour]
  erb :rocky_result
end

get '/whatsup' do
  'Whats up ' + params[:name] + ' ' + params[:surname]
end
