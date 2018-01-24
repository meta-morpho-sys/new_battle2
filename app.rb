require 'sinatra/base'

# App controller class
class Battle < Sinatra::Base
  set :session_secret, 'here be dragons'
  enable :sessions

  get '/' do
    erb :index
  end

  get '/new_player_form' do
    erb :new_player_form
  end

  post '/players' do
    session[:monster_name1] = params[:monster_name1]
    session[:monster_name2] = params[:monster_name2]
    puts 'session after post is:'
    p session
    redirect '/play'
  end

  get '/play' do
    @player1 = session[:monster_name1]
    @player2 = session[:monster_name2]
    erb :play
  end

  get '/attack' do
    @player1 = session[:monster_name1]
    @player2 = session[:monster_name2]
    erb :attack
  end

  run! if app_file == $PROGRAM_NAME
end
