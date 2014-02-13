require_relative "../lib/sales_person"
require_relative "../lib/route"

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

  it "should calculate a route via the Route" do
    cities = [double, double, double]
    subject.stub(:cities) { cities }
    Route.any_instance.should_receive(:calculate).with(cities)
    subject.route
  end
  it "should return the route from Route" do
    route_stub = [double, double]
    Route.any_instance. stub(:calculate) { route_stub }
    subject.route.should eq(route_stub)
  end

  it "should allow for the starting point to be specified" do
    city = double
    subject.schedule_city(city, starting_city: true)
    subject.starting_city.should eq(city)
  end

  it "should calculate total miles traveled via Route" do
    Route.any_instance.should_receive(:miles_traveled)
    subject.miles_traveled
  end

  it "should return total time traveled at 60 mph via Route" do
    Route.any_instance.should_receive(:time_traveled)
    subject.time_traveled
  end
end
