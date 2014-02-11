Dir["./lib/*.rb"].each {|file| require file }

require 'benchmark'
require_relative "benchmark_helper"

phil = SalesPerson.new

Benchmark.bm do |x|
  x.report("2 cities") do
    phil.schedule_city(Place.build("Chino Hills, CA"), starting_city: true)
    1.upto(2) do |city|
      phil.schedule_city(Place.build(CITIES[city]))
    end
  end

  x.report("10 cities") do
    phil.schedule_city(Place.build("Chino Hills, CA"), starting_city: true)
    1.upto(10) do |city|
      phil.schedule_city(Place.build(CITIES[city]))
    end
  end

  x.report("50 cities") do
    phil.schedule_city(Place.build("Chino Hills, CA"), starting_city: true)
    1.upto(50) do |city|
      phil.schedule_city(Place.build(CITIES[city]))
    end
  end

  x.report("200 cities") do
    phil.schedule_city(Place.build("Chino Hills, CA"), starting_city: true)
    1.upto(200) do |city|
      phil.schedule_city(Place.build(CITIES[city]))
    end
  end
end
