TESTING = "Here are some constant words."
$testing = "Here are some global words."

# cannot be seen from blocks w/ local scope
testing = "Here are some local words."

if testing
  puts testing
else
  puts "I can't see 'testing' from here."
end

count = 4
while count >= 0
  puts testing
  count -= 1
end


def print_tests
  puts TESTING
  puts $testing

  if testing
    puts testing
  else
    puts "I can't see 'testing' from here."
  end
end

print_tests
