require 'sinatra/base'

# App controller class
class Battle < Sinatra::Base
  set :session_secret, 'here be dragons'

  get '/' do
    erb :index
  end

  get '/new_player_form' do
    erb :new_player_form
  end

  post '/players' do
    p params
    @player1 = params[:monster_name1]
    @player2 = params[:monster_name2]
    erb :players
  end

  run! if app_file == $PROGRAM_NAME
end
