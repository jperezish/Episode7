class Route
  attr_reader :miles_traveled

  def initialize
    @miles_traveled = 0
  end

  def calculate(points)
    remaining_points = points
    route = []
    route << remaining_points.slice!(0)
    until remaining_points == [] do
      next_point = shortest_distance(route.last, remaining_points)
      route << remaining_points.slice!(remaining_points.index(next_point))
    end
    route
  end

  def shortest_distance(from, possible)
    distances = possible.map do |point|
      {point: point, distance: Map.distance_between(from, point)}
    end
    get_the_shortest_distance_from(distances)
  end

  def get_the_shortest_distance_from(distances)
    shortest_distance = distances.sort{|a,b| a.fetch(:distance) <=> b.fetch(:distance)}
    add_to_miles_traveled(shortest_distance.first.fetch(:distance))
    shortest_distance.first.fetch(:point)
  end

  def add_to_miles_traveled(miles)
    @miles_traveled += miles
  end
end


