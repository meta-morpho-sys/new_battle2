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
    player1 = Player.new(params[:monster_name1])
    player2 = Player.new(params[:monster_name2])
    $game = Game.new(player1, player2)
    redirect '/play'
  end

  get '/play' do
    @game = $game
    erb :play
  end

  post '/attack' do
    $game.attack
    if $game.game_over?
      redirect '/game-over'
    else
      redirect '/attack'
    end
  end

  get '/attack' do
    @game = $game
    erb :attack
  end

  post '/switch-turn' do
    $game.switch_turn
    redirect '/play'
  end

  get '/game-over' do
    erb :game_over
  end

  run! if app_file == $PROGRAM_NAME
end
