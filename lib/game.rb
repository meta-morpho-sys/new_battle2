# Manages attacks and other rules.
class Game
  attr_reader :current_turn

  def self.create(player1, player2)
    @game = Game.new(player1, player2)
  end

  def self.instance_access
    @game
  end

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

  def attack(player = other_turn)
    player.receive_damage
  end

  def paralyse(player = other_turn)
    player.try_to_paralyse
  end

  def thaw(player = other_turn)
    player.paralysed = false
  end

  def poison(player = other_turn)
    player.receive_damage(5)
  end

  def switch_turn
    @current_turn = other_turn unless other_turn.paralysed?
  end

  def other_turn
    opponent_of(current_turn)
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
