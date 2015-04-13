# sets the encoding to utf-8 (default is ASCII)
# -*- coding: utf-8 -*-

# prints in the terminal the quoted text
puts "I will now count my chickens:"

# prints the text & does the calculation between {} in line
puts "Hens #{25.0 + 30.0 / 6.0}"
# 25 + 5 = 30
# also prints the text & does the {} calculation in line
puts "Roosters #{100.0 - 25.0 * 3.0 % 4.0}"
# 100 - 75 / 4 remainder = 100-3 = 97

# prints the quoted text in the terminal
puts "Now I will count the eggs:"

# prints the result of the calculation in the terminal
puts 3.0 + 2.0 + 1.0 - 5.0 + 4.0 % 2.0 - 1.0 / 4.0 + 6.0
# 5 - 4 + 0 - .25 + 6 = 1 - .25 + 6 = 6.75 <-- now w/ floating point will be right

# prints the string
puts "Is it true that 3 + 2 < 5 - 7?" # 5.0 < -2.0? NO

# prints the result of the (boolean) calculation
puts 3.0 + 2.0 < 5.0 - 7.0 #false

# prints the string & does the inline calculation
puts "What is 3 + 2? #{3.0 + 2.0}" # 5
# prints the string w/ inline calculation
puts "What is 5 - 7? #{5.0 - 7.0}" # -2

# prints the string
puts "Oh, that's why it's false."

# prints the string
puts "How about some more."

# prints the string w/ inline calculation
puts "Is it greater? #{5.0 > -2.0}" #true
# prints str w/ inline calc
puts "Is it greater or equal? #{5.0 >= -2.0}" #still true
# prints str w/ inline calc
puts "Is it less or equal? #{5.0 <= -2.0}" #false