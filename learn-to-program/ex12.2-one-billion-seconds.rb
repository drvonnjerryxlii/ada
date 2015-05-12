# after stripping spaces and commas out a provided string, verifies whether
# said string is qualified to be turned into a number. returns it as an integer
# if so. gives the user a hint and calls itself again if not.
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
    puts "You said #{user_number}. That doesn't look like a number to me."
    puts "Please provide your number in numeric format (eg, 52, -4,003.16)."
    return verify_number($stdin.gets.chomp)
  end
end


def check_age(age_in_seconds)
  seconds_per_minute = 60
  minutes_per_hour = 60
  hours_per_day = 24
  days_per_year = 365

  seconds_per_hour = seconds_per_minute * minutes_per_hour
  seconds_per_day = seconds_per_hour * hours_per_day
  seconds_per_year = seconds_per_day * days_per_year

  years_remaining = age_in_seconds / seconds_per_year
  days_remaining = age_in_seconds % seconds_per_year / seconds_per_day
  hours_remaining = age_in_seconds % seconds_per_day / seconds_per_hour
  minutes_remaining = age_in_seconds % seconds_per_hour / seconds_per_minute
  seconds_remaining = age_in_seconds % seconds_per_minute

  result = {
    years: years_remaining,
    days: days_remaining,
    hours: hours_remaining,
    minutes: minutes_remaining,
    seconds: seconds_remaining
  }

  return result
end


def display_age(age)
  print "#{age[:years]} years, #{age[:days]} days, #{age[:hours]} hours, "
  print "#{age[:minutes]} minutes, and #{age[:seconds]} seconds"
end


def one_billion_seconds
  one_billion_seconds = 1_000_000_000

  seconds_per_minute = 60
  minutes_per_hour = 60
  hours_per_day = 24
  days_per_year = 365

  seconds_per_hour = seconds_per_minute * minutes_per_hour
  seconds_per_day = seconds_per_hour * hours_per_day
  seconds_per_year = seconds_per_day * days_per_year

  puts "How many years do you have on you?"
  current_age = verify_number($stdin.gets.chomp)

  current_age_in_seconds = current_age * seconds_per_year

  # puts "One billion seconds is:"
  # display_age(check_age(one_billion_seconds))
  # puts "."
  # puts "Isn't that cool?"

  if current_age_in_seconds > one_billion_seconds
    puts "You are already over one billion seconds old!"
    puts "It happened approximately:"
    this_long = check_age(current_age_in_seconds - one_billion_seconds)
    display_age(this_long)
    puts " ago."
  else
    puts "You are not yet one billion seconds old!"
    puts "It will happen in approximately:"
    this_long = check_age(one_billion_seconds - current_age_in_seconds)
    display_age(this_long)
    puts " from now."
  end
end


one_billion_seconds
