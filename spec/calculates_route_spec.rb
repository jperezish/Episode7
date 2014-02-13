require_relative "../lib/route"
require_relative "../lib/place"

describe Route do
  let(:dallas) {Place.build("Dallas, TX") }
  let(:austin ) { Place.build("Austin, TX")}
  let(:lubbock ) { Place.build("Lubbock, TX")}
  let(:el_paso ) { Place.build("El Paso, TX")}
  let (:points) {[dallas, el_paso, austin, lubbock]}
  let(:route) { Route.new }

  it "should calculate the route" do
    expected = [dallas, austin, lubbock, el_paso]
    route.calculate(points).should eq(expected)
  end

  it "should provide the shortest distance between a set of routes" do
    remaining_points = [lubbock, dallas, el_paso]
    route.shortest_distance(austin, remaining_points). should eq(dallas)
  end

  it "should calculate total miles traveled" do
    route.calculate(points)
    route.miles_traveled.should be_within(1).of(812)
  end

  it "should calculate total travel time" do
    route.calculate(points)
    route.time_traveled.should be_within(0.1).of(14.76)
  end
end

