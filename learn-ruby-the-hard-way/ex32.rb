# -*- coding: utf-8 -*-
# 
# the_count = [1, 2, 3, 4, 5]
# fruits = ['apples', 'oranges', 'pears', 'apricots']
# change = [1, 'pennies', 2, 'dimes', 3, 'quarters']
# 
# this first kind of for-loop goes through a list
# in a more traditional style found in other languages
# the_count.each { |number| puts "This is count #{number}" }
# 
# same as above, but in a more Ruby style
# this and the next one are the preferred
# way Ruby for-loops are written
# fruits.each { |fruit| puts "A fruit of type: #{fruit}" }
# 
# also we can go through mixed lists too
# note this is yet another style, exactly like above
# but a different syntax (way to write it).
# change.each {|i| puts "I got #{i}" }
# 
# we can also build lists, first start with an empty one
# elements = []
# 
# then use the range operator to do 0 to 5 counts
# (0..5).each { |i| puts "adding #{i} to the list."; elements << i }
# 
# now we can print them out too
# elements.each {|i| puts "Element was: #{i}" }

test = [1, 2, 3, 4, 5, 6, 7, 8, 9]
print test; print "\n"

testing = []
test.each { |i| if i % 2 == 0; testing.push(i); end }
print testing; print "\n"

tested = test - testing
print tested; print "\n"

tested = test & testing
print tested; print "\n"

tested = test + testing
print tested; print "\n"

tested = test | testing
print tested; print "\n"

tested = test.map { |i| i * 2 }
print tested; print "\n"

tested = test.reject { |i| i % 2 == 0 }
print tested; print "\n"