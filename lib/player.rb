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

  def receive_damage(max_range = 15)
    @hit_points -= random_hit_points(max_range)
  end

  def reduce_damage(max_range = 15)
    @hit_points += random_hit_points(max_range)
  end

  def random_hit_points(max_range)
    @damage_score = Kernel.rand(0..max_range)
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
