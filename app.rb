require 'sinatra/base'

# App controller class
class Battle < Sinatra::Base
  set :session_secret, 'here be dragons'

  get '/' do
    erb :index
  end

  run! if app_file == $PROGRAM_NAME
end
