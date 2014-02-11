class SalesPerson

  attr_reader :cities, :starting_city
  def initialize
    @cities = []
  end

  def schedule_city(city, options={})
    if options[:starting_city] == true
      @starting_city ||= city
      @cities.unshift(@starting_city)
    end
    @cities << city unless @cities.include?(city)
  end

  def route
    CalculatesRoute.calculate(cities)
  end
end
