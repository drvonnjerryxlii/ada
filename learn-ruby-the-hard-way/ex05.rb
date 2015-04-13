# -*- coding: utf-8 -*-

name = "Zed A. Shaw"
age = 35 # not a lie in 2009
height_inches = 74 # inches
weight_pounds = 180 # lbs
inches_to_centimeters = 2.54
pounds_to_kilograms = 0.453592
height_centimeters = height_inches * inches_to_centimeters
weight_kilograms = weight_pounds * pounds_to_kilograms
eyes = 'Blue'
teeth = 'White'
hair = 'Brown'

puts "Let's talk about #{name}."
puts "He's #{height_inches} inches (or #{height_centimeters} centimeters) tall."
puts "He's #{weight_pounds} pounds (or #{weight_kilograms} kilograms) heavy."
puts "Actually that's not too heavy."
puts "He's got #{eyes} eyes and #{hair} hair."
puts "His teeth are usually #{teeth} depending on the coffee."

# this line is tricky, try to get it exactly right
puts "If I add #{age}, #{height_inches}, and #{weight_pounds} I get #{age + height_inches + weight_pounds}."

