# -*- coding: utf-8 -*-

# print "How old are you? "
# age = gets.chomp
# print "How tall are you? "
# height = gets.chomp
# print "How much do you weigh? "
# weight = gets.chomp
# 
# puts "So you're #{age} old, #{height} tall and #{weight} heavy."

current_year = 2015

puts "What's your name, visitor?"
name = gets.chomp

puts "And how old are you, #{name}?"
age = gets.chomp.to_i

birth_year = current_year - age

puts "Tell me something!"
something = gets.chomp

puts "What's your favorite number?"
number = gets.chomp.to_i

something = something.reverse

puts "OK! Here's what I've discovered."
puts "#{name} was born in #{birth_year}, and the people cried from the hills:"
puts (something + "\n") * number
