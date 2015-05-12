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



def verify_month(month)
  months = {
    jan: {name: "January", month: 1},
    feb: {name: "Feburary", month: 2},
    mar: {name: "March", month: 3},
    apr: {name: "April", month: 4},
    may: {name: "May", month: 5},
    jun: {name: "June", month: 6},
    jul: {name: "July", month: 7},
    aug: {name: "August", month: 8},
    sep: {name: "September", month: 9},
    oct: {name: "October", month: 10},
    nov: {name: "November", month: 11},
    dec: {name: "December", month: 12}
    }

  if month.include? "jan"
    return months[:jan]

  elsif month.include? "feb"
    return months[:feb]

  elsif month.include? "mar"
    return months[:mar]

  elsif month.include? "apr"
    return months[:apr]

  elsif month.include? "may"
    return months[:may]

  elsif month.include? "jun"
    return months[:jun]

  elsif month.include? "jul"
    return months[:jul]

  elsif month.include? "aug"
    return months[:aug]

  elsif month.include? "sep"
    return months[:sep]

  elsif month.include? "oct"
    return months[:oct]

  elsif month.include? "nov"
    return months[:nov]

  elsif month.include? "dec"
    return months[:dec]

  end

  puts "You said #{month}. I'm sorry. I don't recognize that month."
  return verify_month($stdin.gets.chomp.downcase)
end



# !W redo this to actually use time component
def print_this_times_age(this)
  current_year = 2016
  current_month = 5
  current_day = 12

  puts "What year were you born in? (eg, 1996)"
  year = verify_number($stdin.gets.chomp)
  puts "What month? (eg, May)"
  month = verify_month($stdin.gets.chomp.downcase)
  puts "What day? (eg, 7, 7th)"
  day = verify_number($stdin.gets.chomp)

  age = 0
  if (month[:month] < current_month) || (month[:month] == current_month && day >= current_day)
    age += current_year - year
  else
    age += (current_year - year) - 1
  end

  if age <= 1
    puts "Wow! I can't believe you were able to answer all these questions."
    puts "You are an extremely talented toddler!"
  else
    print this * age
  end
end



print_this_times_age("sadfjasldkfjasdlf ")
