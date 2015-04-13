# -*- coding: utf-8 -*-

# var cars is set equal to 100
cars = 100
# var space_in_a_car is set equal to 4.0
space_in_a_car = 4.0
# var drivers is set equal to 32
drivers = 32 #awkward! ruby rounds down. how to round up?
# var passengers is set equal to 90
passengers = 90
# var cars_not_driven is set equal to cars minus drivers
cars_not_driven = cars - drivers
# var cars_driven is set equal to drivers (even if drivers > cars_driven!)
cars_driven = drivers
# carpool_capacity is set equal to cars_driven multiplied by space_in_a_car
carpool_capacity = cars_driven * space_in_a_car
# average_passengers_per_car is set equal to passengers divided by cars_driven
average_passengers_per_car = passengers / cars_driven

puts "There are #{cars} cars available."
puts "There are only #{drivers} drivers available."
puts "There will be #{cars_not_driven} empty cars today."
puts "We can transport #{carpool_capacity} people today."
puts "We have #{passengers} to carpool today."
puts "We need to put about #{average_passengers_per_car} in each car."