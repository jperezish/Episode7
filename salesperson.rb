Dir["./lib/*.rb"].each {|file| require file }


phil = SalesPerson.new
phil.schedule_city(Place.build("Whittier, CA"))
phil.schedule_city(Place.build("Chino Hills, CA"), starting_city: true)
phil.schedule_city(Place.build("Brea, CA"))
phil.schedule_city(Place.build("Irvine, CA"))

puts phil.route
puts phil.miles_traveled