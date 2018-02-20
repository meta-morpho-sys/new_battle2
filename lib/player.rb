# Stores names, tracks hit points
class Player
  DEFAULT_HIT_POINTS = 60
  ERROR_ZERO_POINTS_LEFT = '0 HP left'.freeze
  attr_reader :name, :hit_points, :damage_score
  attr_accessor :paralysed

  def initialize(name, initial_hit_points = DEFAULT_HIT_POINTS)
    @name = name
    @hit_points = initial_hit_points
    @damage_score = 0
  end

  def receive_damage(min = 0, max = 15)
    @hit_points -= random_hit_points(min, max)
  end

  def reduce_damage
    @hit_points += random_hit_points
  end

  def simply_reduce_damage(score)
    @hit_points += score
  end

  def recover_points
    simply_reduce_damage damage_score
  end

  def try_to_paralyse
    @paralysed = [true, false].sample
  end

  def random_hit_points(min = 0, max = 15)
    @damage_score = Kernel.rand(min..max)
  end

  def a_computer?
    @name == 'Computer'
  end

  def paralysed?
    @paralysed
  end
end
