# yell angrily at employee, repeating their words back to them, before
# delivering their fate.
def angry_boss(user_string)
  puts "WHAT DO YOU MEAN \"#{user_string.upcase}\"?!? YOU'RE FIRED!!"
end


# get & return user input
def get_user_input
  user_input = $stdin.gets.chomp

  return user_input
end


# prompt user to speak to boss. call angry boss on result of get user input.
def talk_to_boss
  puts "Say something to your boss! Go ahead. Say anything:"
  angry_boss(get_user_input)
end


# call talking to boss mechanism
talk_to_boss
