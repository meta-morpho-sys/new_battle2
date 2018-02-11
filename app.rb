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
    @game = Game.create(player1, player2)
    redirect '/play'
  end

  get '/play' do
    @game = Game.instance_access
    erb :play

  end

  # we land here after hitting button ATTACK in /play
  post '/attack' do
    @game = Game.instance_access
    @game.attack
    if @game.game_over?
      redirect '/game-over'
    else
      redirect '/attack'
    end
  end

  # we find the button OK here
  get '/attack' do
    @game = Game.instance_access
    erb :attack
  end

  # we land here after pressing the button OK
  post '/switch-turn' do
    @game = Game.instance_access
    @game.switch_turn
    if @game.current_turn.computer?
      @game.attack
      @game.switch_turn
      redirect '/computer'
    else
      redirect '/play'
    end
  end

  get '/computer' do
    @game = Game.instance_access
    erb :computer
      # redirect '/play'
  end

  get '/game-over' do
    @game = Game.instance_access
    erb :game_over
  end

  run! if app_file == $PROGRAM_NAME
end
