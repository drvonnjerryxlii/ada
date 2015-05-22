# Calculator Exercise
# Finished dinner. Did not finish dessert.



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



# verifies that a number value. takes one parameter.
def verify_number(user_number)
  # first, get rid of spaces & commas
  while (user_number.include? " ") || (user_number.include? ",")
    user_number.slice!(" ")
    user_number.slice!(",")
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
end



# this actually simplifies the operator on top of verifying it
# it takes one argument and checks & simplifies it
def verify_operator(user_operator)
  # we only need the first three characters for these checks
  user_operator = user_operator[0..2].downcase

  # setting valid operators for each type of operation
  operators_addition = { keywords: %w{+ add plu}, symbol: "+" }
  operators_subtraction = { keywords: %w{- sub min}, symbol: "-" }
  operators_multiplication = { keywords: %w{* x mul tim}, symbol: "*" }
  operators_division = { keywords: %w{/ div}, symbol: "/" }
  operators_exponent = { keywords: %w{^ pow exp}, symbol: "^" }
  operators_modulo = { keywords: %w{% mod}, symbol: "%" }

  # putting the operators together for looping action
  valid_operators = [operators_addition, operators_subtraction,
    operators_multiplication, operators_division, operators_exponent,
    operators_modulo]

  # iterates through operators, calling check_keywords on each, and returning
  # the symbol for that operator if it passes the check. because it _returns_
  # something, the loop & whole method will break / complete upon finding a
  # match.
  valid_operators.each do |operators_set|
    if check_keywords(operators_set[:keywords], user_operator)
      return operators_set[:symbol]
    end
  end

  # returns false if no keyword matches are found, so verify_answer will call
  # itself again
  return false
end



# checks for keyword matches in a provided string,
# and returns true or false accordingly
def check_keywords(keywords, check_here)
  keywords.each do |keyword|
    if check_here == keyword
      return true # do whatever cool thing now that you have a match
    end
  end

  return false # don't do whatever cool thing, since this is not a match
end



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



# opens format_answer definition. takes four arguments - the answer/result, the
# first number, the operator, and the second number -- basically all the stuff
# needed for printing out the answer!
def format_answer(result, first_number, operation, second_number)
  output = "That's #{result}! #{first_number} #{operation} #{second_number}"

  # checks if the operation is exponential, so the steps will be spelled out
  if operation == "^"
    # adds the first number to the output string
    output += " = #{first_number}"
    # starts a quick loop based on the second number (minus one b/c already)
    # printed!
    (second_number.to_i-1).times do
      # adds * number to the output string
      output += " * #{first_number}"
    end
  end

  return output + " = #{result}."
end



# now that everything's defined, let's start it up!
calculator_interface
