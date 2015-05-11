def deaf_grandma(user_input, bye_count)
  if user_input == "BYE"
    bye_count += 1
    if bye_count == 3
      puts "BYE, SONNY!"
      return
    end
  end

  if user_input == user_input.upcase
    puts "NO, NOT SINCE 1938!"
  else
    puts "HUH?!  SPEAK UP, SONNY!"
  end

  return deaf_grandma($stdin.gets.chomp, bye_count)
end

puts "Say something to Grandma:"
deaf_grandma($stdin.gets.chomp, 0)
