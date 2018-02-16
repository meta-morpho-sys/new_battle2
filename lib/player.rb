# Stores names, tracks hit points
class Player
  DEFAULT_HIT_POINTS = 60
  ERROR_ZERO_POINTS_LEFT = '0 HP left'.freeze
  attr_reader :name, :hit_points, :damage_score
  attr_accessor :paralysed

  def initialize(name, hit_points = DEFAULT_HIT_POINTS)
    @name = name
    @hit_points = hit_points
  end

  def receive_damage
    @hit_points -= random_hit_points_generator
  end

  def random_hit_points_generator
    @damage_score = Kernel.rand(0..15)
  end

  def a_computer?
    @name == 'Computer'
  end

  def try_to_paralyse
    @paralysed = [true, false].sample
  end

  def paralysed?
    @paralysed
  end
end
