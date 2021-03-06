class SalesPerson

  attr_reader :cities, :starting_city
  def initialize(route = Route.new)
    @cities = []
    @route = route
  end

  def schedule_city(city, options={})
    if options[:starting_city] == true
      @starting_city ||= city
      @cities.unshift(@starting_city)
    end
    @cities << city unless @cities.include?(city)
  end

  def route
    @route.calculate(cities)
  end

  def miles_traveled
    @route.miles_traveled
  end

  def time_traveled
    @route.time_traveled
  end
end
