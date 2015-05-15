def verify_number(number)
  # get rid of spaces
  if number.include? " "
    number.strip!
  end

  # get rid of commas
  while number.include? ","
    number.slice!(",")
  end

  # taking advantage of ascii order
  if (number > "/") && (number < ":")
    if number.to_i > 9000 # ha!
      puts "That number is too big to convert! Please give me a smaller number."
      return verify_number($stdin.gets.chomp)
    else
      return number.to_i
    end

  # getting a new number from the user
  else
    puts "You said #{number}. That doesn't look like a number to me."
    puts "Please provide your number in numeric format (eg, 12, 4,003)."
    return verify_number($stdin.gets.chomp)
  end


end



def check_next_step(equation, numeral)
  # initialize output string
  output = ""

  # add to it if qualified
  if equation > 0
    output += numeral * equation
  end

  return output
end



def convert_integer_to_roman_numeral(integer)
  # numerals
  thousand = "M"
  five_hundred = "D"
  hundred = "C"
  fifty = "L"
  ten = "X"
  five = "V"
  one = "I"
  numerals = [thousand, five_hundred, hundred, fifty, ten, five, one]

  # declare equations
  check_thousand = integer / 1000
  check_five_hundred = integer % 1000 / 500
  check_hundred = integer % 500 / 100
  check_fifty = integer % 100 / 50
  check_ten = integer % 50 / 10
  check_five = integer % 10 / 5
  check_one = integer % 5 / 1
  numeral_checks = [check_thousand, check_five_hundred, check_hundred,
    check_fifty, check_ten, check_five, check_one]

  # initialize output string
  output = ""

  # initialize loop/index count
  count = 0

  (numerals.length).times do
    output += check_next_step(numeral_checks[count], numerals[count])
    count += 1
  end

  return output
end



def introduce_roman_numeral_old
  puts "Hey there! I heard you want help converting things into roman numerals."
  puts "What number would you like to convert? Note: roman numerals can only"
  puts "represent integer values, so I will round down non-integer numbers."
  user_number = verify_number($stdin.gets.chomp)
  roman_numeral = convert_integer_to_roman_numeral(user_number)
  puts "You said #{user_number}. That's a great number!"
  puts "#{user_number} in roman numeral form is: #{roman_numeral}."
  puts "Goodbye!"
end



introduce_roman_numeral_old
