# sets encoding to utf8
# -*- coding: utf-8 -*-

# sets filename to first argument
filename = ARGV.first

# sets var txt to call open on filename
txt = open(filename)

# prints str that calls & displays value in filename
print "Here's your file #{filename}:"
# prints w/ new line at end result of calling .read method on txt
puts txt.read

# prints str to term
# print "Type the filename again: "
# sets var file_again to user input value
# file_again = $stdin.gets.chomp
# 
# sets var txt_again to value of calling open on file_again
# txt_again = open(file_again)
# 
# prints result of calling .read on txt_again
# puts txt_again.read

txt.close()