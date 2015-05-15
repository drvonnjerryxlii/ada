# full name greeting:
# Write a program that asks for a person’s first name, then middle, and then
# last. Finally, it should greet the person using their full name.

def isName
   name = $stdin.gets.chomp
   until (name.to_i == 0) && (name.length > 0) do
      puts "I didn't understand that. Could you tell me your name once more?"
      name = $stdin.gets.chomp
   end
   return name
end

def fullNameGreeting
   puts "Hi! It's nice to see you here."
   puts "I'd like to get to know you a little better."
   puts "How about telling me your first name?"
   firstName = isName
   puts "What a cool name! What's your middle name?"
   middleName = isName
   puts "Awesome! Would you tell me your last name, too?"
   lastName = isName
   puts "Thank you. I'm so glad to meet you!"
   puts "Welcome to Ada, #{firstName} #{middleName} #{lastName}."
end

fullNameGreeting


# bigger better number
# Write a program that asks for a person’s favorite number. Have your program
# add 1 to the number, and then suggest the result as a bigger and better
# favorite number. (Do be tactful about it, though.)

def biggerBetterNumber
   puts "Hi again! I hope you are doing well today."
   puts "What's your favorite number?"
   number = $stdin.gets.chomp.to_i
   puts "Oh, #{number}! That's a good one!"
   puts "But in a certain light, wouldn't #{number.succ} be a bit more exciting?"
   puts "Just a thought! ;)"
end

biggerBetterNumber
