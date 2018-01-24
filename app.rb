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
    p params
    session[:monster_name1] = params[:monster_name1]
    session[:monster_name2] = params[:monster_name2]
    puts 'session after post is:'
    p session
    redirect '/play'
  end

  get '/play' do
    puts 'session is:'
    p session
    p @player1 = session[:monster_name1]
    p @player2 = session[:monster_name2]
    p @player1 && @player2
    erb :play
  end

  run! if app_file == $PROGRAM_NAME
end
