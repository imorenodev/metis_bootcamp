class Point
  attr_reader :x, :y

  def self.origin # class method // can also be typed Point.origin instead of self.origin
    new(0, 0) # same as self.new(0, 0)
  end

  def initialize(x, y)
    @x = x
    @y = y
  end

  def distance_from(point)
    Math.sqrt((x - point.x) ** 2 + (y - point.y) ** 2)
  end
end

point1 = Point.origin
point2 = Point.new(2, 2)

puts point1.distance_from(point2)