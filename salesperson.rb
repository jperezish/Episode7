Dir["./lib/*.rb"].each {|file| require file }


jason = SalesPerson.new
jason.schedule_city(Place.build("Whittier, CA"))
jason.schedule_city(Place.build("Chino Hills, CA"), starting_city: true)
jason.schedule_city(Place.build("Brea, CA"))
jason.schedule_city(Place.build("Irvine, CA"))

puts "-----------------------------"
puts "Here's my route:"
puts jason.route
puts "-----------------------------"
puts "This route will cover #{jason.miles_traveled.round(1)} miles, as the crow flies."
puts "If that crow flew 60 mph it'd take #{jason.time_traveled.round(2)} hours."