# Stores names, tracks hit points
class Player
  DEFAULT_HIT_POINTS = 60
  ERROR_ZERO_POINTS_LEFT = '0 HP left'.freeze
  attr_reader :name, :hit_points, :points, :computer

  def initialize(name, hit_points = DEFAULT_HIT_POINTS)
    @name = name
    @hit_points = hit_points
    @computer = name
  end

  def receive_damage
    @hit_points -= random_hit_points_generator
  end

  def random_hit_points_generator
    @points = Kernel.rand(0..15)
  end

  def computer?
    @computer == 'Computer'
  end
end
