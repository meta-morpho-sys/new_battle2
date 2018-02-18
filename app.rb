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
    redirect '/game-status'
  end

  get '/game-status' do
    erb :'game-status'
  end

  post '/attack' do
    @game.attack
    @game.thaw
    redirect '/show-attack' unless @game.game_over?
    redirect '/game-over'
  end

  get '/show-attack' do
    erb :'show-attack'
  end

  post '/paralyse' do
    @game.paralyse
    redirect '/paralyse'
  end

  get '/paralyse' do
    erb 'paralyse'
  end

  post 'poison' do
    @game.poison
    redirect
  end

  get '/switch-turn' do
    @game.switch_turn
    if @game.current_turn.a_computer?
      @game.attack
      redirect '/show-attack'
    end
    redirect '/game-status'
  end

  get '/game-over' do
    erb :game_over
  end

  run! if app_file == $PROGRAM_NAME
end
