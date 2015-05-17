# Calculator Exercise
# Finished dinner. Did not finish dessert.

# runs the calculation! takes three args: the first number, the operation
# applied to it, and the second number.
def calculate(first_number, operation, second_number)

  if (operation == "+")
    return first_number + second_number

  elsif (operation == "-")
    return first_number - second_number

  elsif (operation == "*")
    return first_number * second_number

  elsif (operation == "/")
    return first_number / second_number

  elsif (operation == "^")
    return first_number ** second_number

  elsif (operation == "%")
    return first_number % second_number

  end
end


# this is only separate from the interface for readability.
# I didn't want any of the calculation to happen there.
def simplify_number(number)
  if number == number.to_i
    return number.to_i
  else
    return number
  end
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
    end
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
end




# verifies that a number value. takes one parameter.
def verify_number(user_number)
  # first, get rid of spaces & commas
  if [" ", ","].include? user_number
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
    return false
  end

  # !T test
  puts "This should never make it onto the screen!"
end



# verifies user input. takes two arguments: the user input itself
# & whether the input should be number.
def verify_user_input(user_input, should_be_number)

  # handling empty user input
  until user_input.length > 0 do
    puts "I'm sorry. I didn't understand that. Can you tell me again?"
    user_input = $stdin.gets.chomp
  end

  # handling number values that don't pass
  if should_be_number && !verify_number(user_input)
    puts "You said: #{user_input}. That's not a number I recognize."
    puts "Can you say it to me differently? I understand numbers like -12 or 65.012."
    puts "I don't understand spelled-out numbers like nine thousand and eight."

    return verify_user_input($stdin.gets.chomp,true)

  # handling operator values that don't pass
  elsif !should_be_number && !verify_operator(user_input)
    puts "Oops. That's not a math operator I recognize. Can you say it differently?"
    puts "I can do addition, subtraction, multiplication, division, modulo, and"
    puts "exponent calculations."

    return verify_user_input($stdin.gets.chomp,false)
  end

  # simplifies user operator
  if !should_be_number
    user_input = verify_operator(user_input)
  end

  # returns qualified user_input! if the interpreter gets this far, the user_input has
  # passed all the qualification tests! :)
  return user_input
end




# opens format_answer definition. takes four arguments - the answer/result, the
# first number, the operator, and the second number -- basically all the stuff
# needed for printing out the answer!
def format_answer(result, first_number, operation, second_number)
  output = "That's #{result}! #{first_number} #{operation} #{second_number} = "

  # checks if the operation was not exponential
  if operation != "^"
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
    end
  end

  return output + " = #{result}."
end


# runs the calculator user interface! takes zero arguments, because we don't
# have anything to pass around yet. calls verify_answer on each answer, and will
# eventually call the calculate operation with user data that passes the verify
# steps. :)
def calculator_interface
  puts "Hi! I'm a basic calculator. What number would you would like to do some math on?"
  first_number = verify_user_input($stdin.gets.chomp, true)

  puts "What operation would you like to perform on #{first_number}?"
  operation = verify_user_input($stdin.gets.chomp, false)

  puts "What do you want to #{operation} to #{first_number}?"
  second_number = verify_user_input($stdin.gets.chomp,true)

  puts "Okay, so I'm going to do: #{first_number} #{operation} #{second_number}!"
  result = calculate(first_number.to_f, operation, second_number.to_f)

  result = simplify_number(result)

  puts format_answer(result, first_number, operation, second_number)
end


calculator_interface
