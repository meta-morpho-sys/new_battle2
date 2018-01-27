# Manages attacks and other rules.
class Game
  attr_reader :current_turn

  def initialize(player1, player2)
    @players = [player1, player2]
    @current_turn = player1
  end

  def player1
    @players.first
  end

  def player2
    @players.last
  end

  def attack(player = opponent_of(current_turn))
    player.receive_damage
  end

  def switch_turn
    @current_turn = opponent_of(current_turn)
  end

  def opponent_of(the_player)
    @players.reject { |player| player == the_player }.first
  end

  def game_over?
    losing_players.any?
  end

  def loser
    losing_players.first
  end

  private

  def losing_players
    @players.select { |player| player.hit_points <= 0 }
  end
end
