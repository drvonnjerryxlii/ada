# -*- coding: utf-8 -*-

# sets var to first arg
input_file = ARGV.first

# begins func def & declares one param
def print_all(f)
	# calls read method on param/var & prints to term
	puts f.read
# ends func def
end

# begins func def & decl one param
def rewind(f)
	# calls seek method with (line) 0 arg on param/var to jump to top of file 
	f.seek(0)
# ends func def
end

# begins func def & decl one param
def print_a_line(line_count, f)
	# prints str to term, str calls line_count
	# & then prints next line irrespective of line_count
	# using gets to grab until the next new line (\n)
	# & using str method chomp to remove trailing \n
	puts "#{line_count}, #{f.gets.chomp}"
# ends func def
end

# sets var to the opening of input_file
current_file = open(input_file)

# prints giv str to term
puts "First let's print the whole file: \n"

# calls func on current_file
print_all(current_file)

# prints giv str to term
puts "Now let's rewind, kind of like a tape."

# calls func on current_file
rewind(current_file)

# prints giv str to term
puts "Let's print three lines:"

# sets var to int val
current_line = 1 # 1
# calls func w/ current_line & current_file
print_a_line(current_line, current_file) # result: file cursor now on next line

# increments current_line by 1
current_line += 1 # 1 + 1 = 2
# calls func w/ new val of current_line & current_file
print_a_line(current_line, current_file) # result: file cursor now on next line

# inc current_line by 1 again
current_line += 1 # 2 + 1 = 3
# calls func w/ new val of current_lint & current_file
print_a_line(current_line, current_file)

current_file.close