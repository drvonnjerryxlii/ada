# puts 1+2
# puts 1.0 + 2.0
# puts 2.0 * 3.0
# puts 5.0 - 8.0
# puts 9.0 / 2.0
# puts 1+2
# puts 2*3
# puts 5-8
# puts 9/2
# puts 5 * (12-8) + -15
# puts 98 + (59872 / (13*8)) * -51

# var test
# test = 1
# testAgain = test
# # testAgain += 1
# test += 1
# puts "'#{test}' is test, and '#{testAgain}' is testAgain."
# hrm. they point at one number, not at each other the way it looks


# declare what's going on here
puts 'This\'s exercise 2.5 from Learn To Program (Second Edition).'
puts 'Press enter if that\'s what you wanted to see!'
puts 'Otherwise, Ctrl+C (⌃C) is your friend.'
$stdin.gets

# base vars
yearsPerDecade = 10
daysPerYear = 365
hoursPerDay = 24
minutesPerHour = 60
secondsPerMinute = 60
myAgeInYears = 2015 - 1986 # roughly true story! (months, shmonths.)
dearAuthorsAgeInSeconds = 1160 * 1000000 # as given

# extending seconds b/c age questions
secondsPerHour = secondsPerMinute * minutesPerHour
secondsPerDay = secondsPerHour * hoursPerDay
secondsPerYear = secondsPerDay * daysPerYear
secondsPerYearFloat = 1.0 * secondsPerYear

# calculate answers (this could be done as part of puts statement)
hoursPerYear = daysPerYear * hoursPerDay
minutesPerDecade = yearsPerDecade * hoursPerYear * minutesPerHour
myAgeInSeconds = myAgeInYears * secondsPerYear
dearAuthorsAgeInYears = dearAuthorsAgeInSeconds / secondsPerYear
dearAuthorsAgeInYearsFloat = dearAuthorsAgeInSeconds / secondsPerYearFloat

# now print answers to screen
puts "There are #{hoursPerYear} hours per year."
puts "There are #{minutesPerDecade} minutes per decade."
puts "My age (#{myAgeInYears} years) in seconds: #{myAgeInSeconds}."
puts "Our dear author's age (#{dearAuthorsAgeInSeconds} seconds) in years: #{dearAuthorsAgeInYears}."
puts "Okay, let's be a little more precise about our dear author: #{dearAuthorsAgeInYearsFloat} years."
