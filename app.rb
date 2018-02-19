require 'sinatra/base'
require './lib/player'
require './lib/game'
require './lib/time_delays'

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

  before do
    @game = Game.instance_access
  end

  post '/start-game' do
    player1 = Player.new(params[:monster_name1])
    player2 = Player.new(params[:monster_name2])
    @game = Game.create(player1, player2)
    redirect '/game_status'
  end

  get '/game_status' do
    erb :game_status
  end

  post '/attack' do
    @game.attack
    @game.thaw
    redirect '/show_attack' unless @game.game_over?
    redirect '/game_over'
  end

  get '/show_attack' do
    erb :show_attack
  end

  post '/heal' do
    @game.heal
    redirect '/switch_turn'
  end

  post '/paralyse' do
    @game.paralyse
    redirect '/paralyse'
  end

  get '/paralyse' do
    erb :paralyse
  end

  post '/poison' do
    @game.poison
    redirect '/poisoned'
  end

  get '/poisoned' do
    erb :poisoned
  end

  get '/switch_turn' do
    @game.switch_turn
    if @game.current_turn.a_computer?
      @game.attack
      redirect '/show_attack'
    end
    redirect '/game_status'
  end

  get '/game_over' do
    erb :game_over
  end

  run! if app_file == $PROGRAM_NAME
end
