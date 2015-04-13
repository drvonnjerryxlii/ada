# -*- coding: utf-8 -*-

# first, second, third = ARGV
# 
# puts "Your first variable is: #{first}"
# puts "Your second variable is: #{second}"
# puts "Your third variable is: #{third}"

# name, age, goal, direction = ARGV
# 
# puts "Hi #{name}! Let me see here..."
# puts "It looks like you're #{age}."
# puts "And according to my records, you're interested in #{goal}."
# puts "You need to go #{direction} for the winter."
# puts "That's where you'll find #{goal}."


# number, another_number = ARGV
# 
# puts "#{number} * #{another_number} = #{number.to_i * another_number.to_i}"	

name, rank, serialNo = ARGV

print "How long have you worked here? "
forbidden_knowledge = gets.chomp

puts "Name: #{name}"
puts "Rank: #{rank}"
puts "Serial number: #{serialNo}"
puts "Duration of service: #{forbidden_knowledge}"
