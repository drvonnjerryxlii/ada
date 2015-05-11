# finds the leap years
def find_leap_years(start_year, end_year)
  leap_years = []

  if start_year > end_year # eg, 2004 > 1994
    temp_storage = start_year # temp = 2004
    start_year = end_year # start = 1994
    end_year = temp_storage # end = temp = 2004
  end

  current_year = start_year

  # this has to happen once outside the loop, because otherwise if function is
  # called with 1984 & 1984 it won't output that 1984 is a leap year.
  if current_year % 4 == 0
    leap_years.push(start_year)
  end


  while current_year < end_year
    current_year += 1
    if current_year % 4 == 0
      leap_years.push(current_year)
    end
  end

  puts "The leap years from #{start_year} to #{end_year} are:"
  leap_years.each do |leap_year|
    puts "\t* #{leap_year}"
  end
end


# ripped from my random menu program ;)
def verify_number(user_number)
  if user_number.include? " "
    user_number.strip!
  end
  while user_number.include? ","
    user_number.slice!(",")
  end

  if (user_number > "/") && (user_number < ":")
    return user_number.to_i
  else
    speak("You said #{user_number}. That doesn't look like a number to me.")
    speak("Please provide your number in numeric format (eg, 1200, 1997).")
    return verify_number($stdin.gets.chomp)
  end
end


# finds out which years user wants to find leap years between and calls find
# leap years with those numbers
def ask_user_which_leap_years
  puts "So you want to know about leap years, huh?"

  puts "What year should I start searching for leap years from?"
  start_year = verify_number($stdin.gets.chomp)

  puts "And where should I stop looking for leap years?"
  end_year = verify_number($stdin.gets.chomp)

  puts "Okay, great! I'll start looking in #{start_year}, and I'll stop in #{end_year}."
  find_leap_years(start_year, end_year)
end


# calls it
ask_user_which_leap_years
