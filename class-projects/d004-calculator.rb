# Calculator Exercise
# Finished dinner. Did not finish platinum.




# opens unhelpful help_user definition
def help_user
  # prints some unhelpful text to the screen
  puts "I'm not a professional. I'm afraid I can't help you like that."
  # prompts the user to hit enter
  print "Press enter/return to continue."
  # waits for user to press enter
  $stdin.gets
# ends help_user definition & sends user's intepreter back from whence it came
end




# runs the calculation! takes three params: the first number, the operation
# applied to it, and the second number.
def calculate(first_number, operation, second_number)
  # first it checks for addition
  if (operation == "+")
    # if there, it returns the result of adding the two numbers together
    return first_number + second_number
  # then it checks for subtraction
  elsif (operation == "-")
    # if there, it returns the result of subtracting the firest number from the second
    return first_number - second_number
  # then it checks for multiplication
  elsif (operation == "*")
    # if there, it returns the result of multiplying the two numbers together
    return first_number * second_number
  # then it checks for division
  elsif (operation == "/")
    # if there, it returns the result of dividing the first number by the second
    return first_number / second_number
  #  then it checks for exponentiation
  elsif (operation == "^")
    # if there, it returns the result of the first number to the second number's power >_>
    return first_number ** second_number
  # then it checks for modulus
  elsif (operation == "%")
    # if there, it returns the result of finding the remainder of the first number divided by the second
    return first_number % second_number
  # closing the if block
  end
# closing the definition
end




# this is only separate from the interface for readability
# I didn't want any of the calculation to happen there
def simplify_number(number)
  # checks if the number is the same as a float and an integer
  if number == number.to_i
    # if it is equal, returns the integer value
    return number.to_i
  # if it's not equal
  else
    # returns the original float
    return number
  # ends the if block
  end
# ends the definition
end




# this actually simplifies the operator on top of verifying it
# it takes one param and checks & simplifies it
# it has some repetition, because I didn't want to mess w/ global variables
# and I'm not sure how else to handle the scope !Q !W?
def verify_operator(user_operator)
  # we only need the first three characters for these checks
  user_operator = user_operator[0..2].downcase

  # setting valid operators for each type of operation
  operators_addition = %w{+ add plu}
  operators_subtraction = %w{- sub min}
  operators_multiplication = %w{* x mul tim}
  operators_division = %w{/ div}
  operators_exponent = %w{^ ** pow exp}
  operators_modulo = %w{% mod}

  # iterates through addition operators
  operators_addition.each do |valid_operator|
    # checks if user operator is same as a valid operator in this group
    if user_operator == valid_operator
      # returns simplified operator if so
      return "+"
    # ends if block
    end
  # ends addition operators iteration block
  end

  # subtraction checks & simplification
  operators_subtraction.each do |valid_operator|
    if user_operator == valid_operator
      return "-"
    end
  end

  # multiplication checks & simplification
  operators_multiplication.each do |valid_operator|
    if user_operator == valid_operator
      return "*"
    end
  end

  # division checks & simplification
  operators_division.each do |valid_operator|
    if user_operator == valid_operator
      return "/"
    end
  end

  # exponent checks & simplification
  operators_exponent.each do |valid_operator|
    if user_operator == valid_operator
      return "^"
    end
  end

  # modulus checks & simplification
  operators_modulo.each do |valid_operator|
    if user_operator == valid_operator
      return "%"
    end
  end

  # returns false if nothing else works, so verify_answer will call itself again
  return false
# ends definition
end




# verifies that a number value. takes one parameter.
def verify_number(user_number)
  # first, get rid of spaces & commas
  if [" ", ","].include? user_number
    # calls & applies to user_number result of squeezing out " " & ","
    user_number.squeeze!(" ").squeeze!(",")
  end

  # if ASCII would say the number is above '/' and below ':',
  # then according to ASCII it's a number in a string! n_n
  # I was sooo excited to discover this! :D
  # awesome ASCII chart: http://www.bibase.com/images/ascii.gif
  if (user_number > "/") && (user_number < ":")
    # since it's a number, returns the user_number
    return user_number
  # if it's not an ASCII character between '/' and ':',
  # then it's not a number in a string
  else
    # so returns false, which will trigger another call of verify answer
    return false
  # ends if block
  end

  # test
  puts "This should never make it onto the screen!"
# ends verify_number definition
end



# verifies user input. takes two params: the user input itself & whether it should be number
def verify_user_input(user_input, should_be_number)
  # checks for calls for help & calls help if so
  if user_input.downcase.strip == "help"
    # calls help_user
    help_user
  # ends if block
  end

  # runs loop as long as user_input is apparently empty
  until user_input.length > 0 do
    # sort of explains why last user_input sucked & asks for new user_input
    puts "I'm sorry. I didn't understand that. Can you tell me again?"
    # assigns user input to var
    user_input = $stdin.gets.chomp
  # ends until not-empty loop
  end

  # checks if it's a number value and if it passed the number test (calls inline)
  if should_be_number && !verify_number(user_input)
    # explains to the user why the last user_input wasn't accepted & requests a new one
    puts "You said: #{user_input}. That's not a number I recognize."
    # offers some advice about acceptable numbers
    puts "Can you say it to me differently? I understand numbers like -12 or 65.012."
    puts "I don't understand spelled-out numbers like nine thousand and eight."
    # calls verify_user_input on the new user input & lets verify_user_input know the
    # user input should be a number
    user_input = verify_user_input($stdin.gets.chomp,true)
    return user_input
  # checks if it's not a number value & whether it failed the operator test,
  # which it calls inline
elsif !should_be_number && !verify_operator(user_input)
    # explains to the user why the last user_input wasn't accepted & requests a new one
    puts "Oops. That's not a math operator I recognize. Can you say it differently?"
    # offers some advice about operations that are available
    puts "I can do addition, subtraction, multiplication, division, modulo, and
exponent calculations."
    # calls verify_user_input on the new user input & lets verify_user_input know the
    # user input should not be a number (should therefore be an operator)
    user_input = verify_user_input($stdin.gets.chomp,false)
    return user_input
  # ends if block
  end

  # test
  puts "This should make it onto the screen after a user_input is verified!"
  puts "The passing item is: #{user_input}."

  # returns qualified user_input! if the interpreter gets this far, the user_input has
  # passed all the qualification tests! :)
  return user_input
# ends verify_user_input definition
end




# opens format_answer definition. takes four arguments - the answer/result, the
# first number, the operator, and the second number -- basically all the stuff
# needed for printing out the answer!
def format_answer(result, first_number, operation, second_number)
  # initializes the output string & sets the beginning of it
  output = "That's #{result}! #{first_number} #{operation} #{second_number} ="

  # checks if the operation was not exponential
  if operation != "^"
    # adds the result to the output string
    output += " #{result}."
  # then checks if it was an exponent operation
  elsif operation == "^"
    # adds the first number to the output string
    output += "#{first_number}"
    # starts a quick loop based on the second number (minus one b/c already)
    # printed!
    (second_number.to_i-1).times do
      # adds * number to the output string
      output += " * #{first_number}"
    # ends the x times block
    end
  # ends the if block
  end

  # returns the output string
  return output + " = #{result}."
# ends the format_answer definition
end




# runs the calculator user interface! takes zero arguments, because we don't
# have anything to pass around yet. calls verify_answer on each answer, and will
# eventually call the calculate operation with user data that passes the verify
# steps. :)
def calculator_interface
  # asks the user for a starting number
  puts "Hi! I'm a basic calculator. What number would you would like to do some math on?"
  # assigns result of calling verify_user_input (+ number = true) on user input
  first_number = verify_user_input($stdin.gets.chomp, true)

  # asks the user for an operation to perform on the given number
  puts "What operation would you like to perform on #{first_number}?"
  # assigns result of calling verify_user_input on user input (+ number = false)
  operation = verify_user_input($stdin.gets.chomp, false)

  # asks the user for a second number
  puts "What do you want to #{operation} to #{first_number}?"
  # assigns result of calling verify_user_input on user input ( + number = true)
  second_number = verify_user_input($stdin.gets.chomp,true)

  # prints the data to the screen
  puts "Okay, so I'm going to do: #{first_number} #{operation} #{second_number}!"
  # assigns the result of calling calculate on the user input variables
  result = calculate(first_number.to_f, operation, second_number.to_f)
  # simplifies variable to integer if float not necessary
  result = simplify_number(result)

  # finally, prints result of calling format_answer to the screen!
  puts format_answer(result, first_number, operation, second_number)
# ends calculator_interface definition
end



# calls the calculator interface! LET THE MADNESS BEGIN
calculator_interface




# unfinished:

# PLATINUM PLATINUM PLATINUM PLATINUM PLATINUM PLATINUM PLATINUM PLATINUM
#
# Make your program know when it needs to return an integer versus a float. YES
# Add support for parentheticals, i.e. 10 / (5 + 5) = 1.
