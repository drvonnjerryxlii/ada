# -*- coding: utf-8 -*-

# Here's some new strange stuff, remember type it exactly

# sets var to giv str
days = "Mon Tue Wed Thu Fri Sat Sun"
# sets var to giv str (\n = newline char \ escapes a new line)
months = "Jan\nFeb\nMar\nApr\nMay\nJun\nJul\nAug"

# prints to term w/ new line at end str that calls var days
puts "Here are the days: #{days}"
# prints to term w/ new line at end str that calls var months
puts "Here are the months: #{months}"

#prints to term w/ new line at end str that starts with new line
puts """
There's something going on here.
With the three double-quotes.
We'll be able to touch as much as we like.
Even 4 lines if we want, or 5, or 6.
"""