# -*- coding: utf-8 -*-
# 
# print "Give me a number: "
# number = gets.chomp.to_i
# 
# bigger = number * 100
# puts "A bigger number is #{bigger}."
# 
# print "Give me another number: "
# another = gets.chomp
# number = another.to_f
# 
# smaller = number / 100
# puts "A smaller number is #{smaller}."

print "Hi! Please input an amount of money: "
number = gets.chomp.to_f
change = number * 0.10

print "Thanks! $#{change} is your change."

# !R huh, these numbers don't seem to be super precise.
# they're pulling a javascript on me!