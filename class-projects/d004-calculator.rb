# Calculator Exercise

# BRONZE BRONZE BRONZE BRONZE BRONZE BRONZE BRONZE BRONZE BRONZE BRONZE BRONZE
#
# Build a calculator command line interface (CLI) that allows a user to perform
# simple arithmetic. YES
# The program should ask for an operation (addition, subtraction, multiplication,
# division) and two numbers, then give the result of applying the operation to
# the two numbers. YES
# The program should accept both the name (add) and the symbol (+) for each
# possible operation. YES


# SILVER SILVER SILVER SILVER SILVER SILVER SILVER SILVER SILVER SILVER SILVER
#
# Print out the formula in addition to the result, i.e. 2 + 2 = 4. YES
# Add support for computing exponents (2^4 = 2 * 2 * 2 * 2 = 16). YES
# Add support for the modulo operator (10 % 3 = 1). YES


# GOLD GOLD GOLD GOLD GOLD GOLD GOLD GOLD GOLD GOLD GOLD GOLD GOLD GOLD GOLD
#
# Gracefully handle unexpected user input:
#
# What happens if the user input is nil (i.e., the user just pressed enter)? YES
# What happens if the user tries to add hotdog to elephant? YES



# runs the calculation! takes three params: the first number, the operation
# applied to it, and the second number.
def calculate(first_number, operation, second_number)
  # first it checks for addition operators
  if (operation == "+")
    # if there are any, it returns the result of adding the two numbers together
    return first_number + second_number
  # then it checks for subtraction operators
  elsif (operation == "-")
    # if there are any, it returns the result of subtracting the firest number from the second
    return first_number - second_number
  # then it checks for multiplication operators
  elsif (operation == "*")
    # if there are any, it returns the result of multiplying the two numbers together
    return first_number * second_number
  # then it checks for division operators
  elsif (operation == "/")
    # if there are any, it returns the result of dividing the first number by the second
    return first_number / second_number
  #  then it checks for exponential operators
  elsif (operation == "^")
    # if there are any, it returns the result of the first number to the second number's power >_>
    return first_number ** second_number
  # then it checks for modulo operators
  elsif (operation == "%")
    # if there are any, it returns the result of finding the remainder of the first number divided by the second
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

  # sets add operators
  operators_addition = %w{+ add plu}
  # sets sub opers
  operators_subtraction = %w{- sub min}
  # sets mul ops
  operators_multiplication = %w{* x mul tim}
  # sets div ops
  operators_division = %w{/ div}
  # sets exp ops
  operators_exponent = %w{** pow exp}
  # sets mod ops
  operators_modulo = %w{% mod}

  # iterates through addition operators
  operators_addition.each do |oper|
    # checks if user operator is same as verif answer
    if answer == oper
      # returns simplified answer
      return "+"
    # ends if block
    end
  # ends add ops iter
  end

  # iters thru sub ops
  operators_subtraction.each do |oper|
    # checks if op is same as verif ans
    if answer == oper
      # returns simplf answer if so
      return "-"
    # ends if block
    end
  # ends sub ops iter
  end

  # iters thru mul ops
  operators_multiplication.each do |oper|
    # checks if op is same as verif ans
    if answer == oper
      # returns smplf answer if so
      return "*"
    # ends if
    end
  # ends iter
  end

  # iters thru div ops
  operators_division.each do |oper|
    # checks if op same as verf ans
    if answer == oper
      # ret smp ans if so
      return "/"
    # ends if
    end
  # ends iter
  end

  # iters thru exp ops
  operators_exponent.each do |oper|
    # checks if op eq verf ans
    if answer == oper
      # ret smp ans if so
      return "^"
    # ends if
    end
  # ends iter
  end

  # iters thru mod ops
  operators_modulo.each do |oper|
    # chks if op eq verf ans
    if answer == oper
      # ret smp ans if so
      return "%"
    # ends if
    end
  # ends iter
  end

  # returns false if nothing else works, so verify_answer will call itself again
  return false
# ends definition
end




# verifies that a number value. takes one parameter.
def verify_number(answer)
  # if ASCII would say the number is above '/' and below ':',
  # then according to ASCII it's a number in a string! n_n
  if (answer > "/") && (answer < ":")
    # since it's a number, returns the answer
    return answer
  # if it's not an ASCII character between '/' and ':',
  # then it's not a number
  else
    # so returns false, which will trigger another call of verify answer
    return false
  # ends if block
  end
# ends verify_number definition
end



# verifies answer. takes two params: the answer itself & whether it should be number
def verify_answer(answer, shouldBeNumber)
  # runs loop as long as answer is apparently empty
  until answer.length > 0 do
    # sort of explains why last answer sucked & asks for new answer
    puts "I'm sorry. I didn't understand that. Can you tell me again?"
    # assigns user input to var
    answer = $stdin.gets.chomp
  # ends until not-empty loop
  end

  # checks if it's a number value and if it passed the number test (calls inline)
  if shouldBeNumber && !verify_number(answer)
    # explains to the user why the last answer wasn't accepted & requests a new one
    puts "Oops. That's not a number I recognize. Can you say it differently?"
    # offers some advice about acceptable numbers
    puts "I understand numbers like -12 or 65.012, but I don't understand
written numbers like negative twelve or sixty-five and twelve thousanths."
    # calls verify_answer on the new user input & lets verify_answer know the
    # user input should be a number
    verify_answer($stdin.gets.chomp,true)
  # checks if it's not a number value & whether it failed the operator test,
  # which it calls inline
  elsif !shouldBeNumber && !verify_operator(answer)
    # explains to the user why the last answer wasn't accepted & requests a new one
    puts "Oops. That's not a math operator I recognize. Can you say it differently?"
    # offers some advice about operations that are available
    puts "I can do addition, subtraction, multiplication, division, modulo, and
exponent calculations."
    # calls verify_answer on the new user input & lets verify_answer know the
    # user input should not be a number (should therefore be an operator)
    verify_answer($stdin.gets.chomp,false)
  # ends if block
  end

  # returns qualified answer! if the interpreter gets this far, the answer has
  # passed all the qualification tests! :)
  return answer
# ends verify_answer definition
end




# opens print_answer definition
# takes five params - the answer/result, the first number, the operator, and
# the second number -- basically all the stuff needed for the answer
def print_answer(result, first_number, operation, second_number)
  # sets the first part of the output
  output = "That's #{result}! #{first_number} #{operation} #{second_number} ="
  # checks if the operation was not exponential
  if operation != "^"
    # adds the result to the output
    output += " #{result}."
  # then checks if it was an exponent operation
  elsif operation == "^"
    # adds the first number to the output
    output += "#{first_number}"
    # starts a quick loop based on the second number (minus one b/c already)
    # printed!
    (second_number.to_i-1).times do
      output += " * #{first_number}"
    end
    puts output + " = #{result}."
  end
end




# runs the calculator user interface! takes zero params, because we don't have
# anything to pass around yet. calls verify_answer on each answer, and will
# eventually call the calculate operation with user data that passes the verify
# steps. :)
# well, okay, technically this is just the opening statement for all that crap.
def calculator_interface
  # asks the user for a starting number
  puts "Hi! I'm a basic calculator. What number would you would like to do math on?"
  # assigns result of calling verify_answer (number!) on user input
  first_number = verify_answer($stdin.gets.chomp,true)
  # asks the user for an operation to perform on the given number
  puts "What operation would you like to perform on #{first_number}?"
  # assigns result of calling verify_not_empty_answer on user input
  operation = verify_answer($stdin.gets.chomp,false)
  # asks the user for a second number
  puts "What do you want to #{operation} to #{first_number}?"
  # assigns result of calling verify_not_empty_answer on user input
  second_number = verify_answer($stdin.gets.chomp,true)
  # prints the data to the screen
  puts "Okay, so we're going to #{first_number} #{operation} #{second_number}!"
  # assigns the result of calling calculate on the user input variables
  result = calculate(first_number.to_f,operation,second_number.to_f)
  # simplifies variable to integer if float not necessary
  result = simplify_number(result)
  # finally, prints result to screen!
  print_answer(result,first_number,operation,second_number)
# ends calculator_interface definition
end



# calls the calculator interface! LET THE MADNESS BEGIN
calculator_interface




# unfinished :(

# PLATINUM PLATINUM PLATINUM PLATINUM PLATINUM PLATINUM PLATINUM PLATINUM
#
# Make your program know when it needs to return an integer versus a float. YES
# Add support for parentheticals, i.e. 10 / (5 + 5) = 1.
