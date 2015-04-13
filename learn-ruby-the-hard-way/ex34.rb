# -*- coding: utf-8 -*-

"""
animals = ['bear', 'ruby', 'peacock', 'kangaroo', 'whale', 'platypus']
The animal at 1. --> animal[1] == 'ruby'
The third (3rd) animal. --> animal[2] == 'peacock'
The first (1st) animal. --> animal[0] == 'bear'
The animal at 3. --> animal[3] == 'kangaroo'
The fifth (5th) animal. --> animal[4] == 'whale'
The animal at 2. --> animal[2] == 'peacock'
The sixth (6th) animal. --> animal[5] == 'platypus'
The animal at 4. --> animal[4] == 'whale'
"""

"""
You can know that January 1st, 2010 is really 2010 in two ways:
1. 1st is ordinal, so it starts from 1. 2010, however, is not. It starts from 0.
2. And there is a year 0.
"""

array1 = [1, 2, 3, 4, 5]

puts array1[0] # 1
puts array1[1] # 2
puts array1[2] # 3
puts array1[3] # 4
puts array1[4] # 5
puts array1[5] # nothing at index

array2 = ["Words", "words", "word", "worD"]

puts array2[2] # "word"
puts array2[4] # nothing at index
puts array2[0] # "Words"
puts array2[3] # "worD"
puts array2[1] # words