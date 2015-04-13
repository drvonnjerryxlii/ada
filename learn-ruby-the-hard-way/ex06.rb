# sets the character encoding to utf-8 <3
# -*- coding: utf-8 -*-

# sets var types_of_people to a value of 10
types_of_people = 10
# sets var x to a value to string w/in a string
x = "There are #{types_of_people} types of people." # string w/in string
# sets var binary to a string value
binary = "binary"
# sets var do_not to string don't
do_not = "don't"
# sets var y to strings w/in a string
y = "Those who know #{binary} and those who #{do_not}." # string w/in string

# prints x to the terminal
puts x
# prints y to the terminal
puts y

# prints a string that calls x
puts "I said: #{x}." # string w/in string
# prints a string that calls y
puts "I also said: '#{y}'." # string w/in string

# sets var hilarious to boolean false
hilarious = false
# sets joke_evaluation to a string that calls hilarious
joke_evaluation = "Isn't that joke so funny?! #{hilarious}" # boolean w/in string

# prints joke_evaluation to terminal
puts joke_evaluation

# sets w to a string value
w = "This is the left side of..."
# sets e to the string value
e = "a string with a right side."

# prints the result of the calculation, adding w & e together
puts w + e	