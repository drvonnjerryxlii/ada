def deaf_grandma(user_input, bye_count, was_last_thing_bye=false)
  unless was_last_thing_bye # if last thing WASN'T bye
    bye_count = 0
  end

  if user_input == "BYE"
    was_last_thing_bye = true
    bye_count += 1

    # finally,  grandma will stop shouting at you!
    if bye_count == 3
      puts "BYE, SONNY!"
      return
    end

  else
    was_last_thing_bye = false

  end

  if user_input == user_input.upcase
    puts "NO, NOT SINCE 1938!"
  else
    puts "HUH?!  SPEAK UP, SONNY!"
  end

  return deaf_grandma($stdin.gets.chomp, bye_count, was_last_thing_bye)
end

puts "Say something to Grandma:"
deaf_grandma($stdin.gets.chomp, 0)
