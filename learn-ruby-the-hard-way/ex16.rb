# -*- coding: utf-8 -*-

filename = ARGV.first

puts "We're going to erase #{filename}"
puts "If you don't want that, hit CTRL-C (^C)."
puts "If you do want that, hit RETURN."

$stdin.gets

puts "Opening the file..."
target = open(filename, 'w')

puts "Truncating the file.  Goodbye!"
target.truncate(0)

puts "Now I'm going to ask you for three lines."

print "line 1: "
line1 = $stdin.gets.chomp
print "line 2: "
line2 = $stdin.gets.chomp
print "line 3: "
line3 = $stdin.gets.chomp

puts "I'm going to write these to the file."

target.write(line1 + "\n" + line2 + "\n" + line3 + "\n")

puts "And finally, we close it."
target.close
puts target.closed?

puts "Would you like to verify the file?"
puts "If you don't want to read it, hit CTRL-C (^C)."
puts "If you do want to read it, hit RETURN."

$stdin.gets

puts "Okay! Opening the file again..."
target = open(filename, 'r')

puts "Here is your newly edited, #{filename}:"
puts target.read

puts "Now to close the file again!"
target.close
puts target.closed?