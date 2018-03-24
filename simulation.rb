# https://www.youtube.com/watch?v=M34TO71SKGk

# draw a cicle inside a square with the diameter equal to the sides of the square
# then randomly throw darts at the target
# the number of darts in the circle divided by the number of total darts thrown
# should be proportional to
# the area of the circle divided by the area of the square
# the area of a circle is pi r^2
# so if the area of the square is one the area of the circle is pi/4
# so the value of pi is approximately the number inside the circle / the total number of darts * 4

require 'gosu'

class DartBoard < Gosu::Window
  HEIGHT =200
  WIDTH = 250
  def initialize
    super HEIGHT, WIDTH
    @point_pairs = []
  end

  def update
    50.times{@point_pairs << PointPair.new}
  end

  def draw
    @point_pairs.map(&:draw)
  end
end

class PointPair
  def initialize
    @a = Point.new
    @b = Point.new
    puts distance
  end

  def distance
    @distance ||= Math.sqrt((@a.x - @b.x)**2 + (@a.y - @b.y)**2).to_i
  end

  def draw
    color = Gosu::Color.new(100, distance, 100, 200)
    @a.draw(color)
    @b.draw(color)
  end
end

class Point
  attr_reader :x, :y
  def initialize
    @x = rand * DartBoard::HEIGHT
    @y = rand * DartBoard::WIDTH
    @size = 3
  end

  def draw(color)
    Gosu.draw_rect(@x, @y, @size, @size, color)
  end
end

DartBoard.new.show
