require_relative "../lib/sales_person"
require_relative "../lib/calculates_route"

describe SalesPerson do
  it "should have many cities" do
    city = double
    subject.schedule_city(city)
    subject.cities.should include(city)
  end

  it "should keep the cities only scheduled once" do
    city = double
    expect{
      subject.schedule_city(city)
      subject.schedule_city(city)
    }.to change(subject.cities,:count).by(1)
  end

  it "should calculate a route via the CalculatesRoute" do
    cities = [double, double, double]
    subject.stub(:cities) { cities }
    CalculatesRoute.should_receive(:calculate).with(cities)
    subject.route
  end
  it "should return the route from CalculatesRoute" do
    route_stub = [double, double]
    CalculatesRoute.stub(:calculate) { route_stub }
    subject.route.should eq(route_stub)
  end

  it "should allow for the starting point to be specified" do
    city = double
    subject.schedule_city(city, starting_city: true)
    subject.starting_city.should eq(city)
  end

  xit "should calculate total miles traveled" do

    subject.miles_traveled.should eq(400)
  end

  it "should return total time traveled at 60 mph"
end
