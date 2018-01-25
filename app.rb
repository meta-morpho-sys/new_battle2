require 'sinatra/base'
require './lib/player'
require './lib/game'

# App controller class
#
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
    $player_1 = Player.new(params[:monster_name1])
    $player_2 = Player.new(params[:monster_name2])
    redirect '/play'
  end

  get '/play' do
    @player1 = $player_1
    @player2 = $player_2
    erb :play
  end

  get '/attack' do
    @player1 = $player_1
    @player2 = $player_2
    Game.new.attack(@player2)
    erb :attack
  end

  run! if app_file == $PROGRAM_NAME
end
