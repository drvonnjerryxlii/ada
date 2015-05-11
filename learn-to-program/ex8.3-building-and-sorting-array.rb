# displays array
def display_array(array)
  puts "Here is your alphabetized list:"
  array.each do |array_item|
    puts array_item
  end
end


# prompts user to begin adding data & builds an array from it.
def build_array
  puts "So you want to have some items sorted for you, huh?"
  puts "Let's get right to it! Just start entering items."
  puts "When you're done, hit enter on an empty line."
  puts "Then I'll sort the list and return it to you. :)"

  array_being_built = []

  user_input = $stdin.gets.chomp

  until user_input == ""
    array_being_built.push(user_input)
    user_input = $stdin.gets.chomp
  end

  # if user hit enter on the first line
  if array_being_built.length == 0
    puts "Oh, you didn't have anything to alphabetize! Goodbye."
  # sorts array & calls display on it
  else
    array_being_built.sort!
    display_array(array_being_built)
  end
end


# calls it
build_array
