require 'csv'
require 'awesome_print'
require 'colorize'

new_student = "Ruby,Also Ruby,555-CALL-Ruby,Rubytown,Totes,ruby@ruby.rubybiz,@ruby-is-great,ruby-is-still-great,Every Year".split(",")

cohort = CSV.open("../../c3-contact-info~.csv", 'a+') do |csv|
  # ap csv.read
  # Kyna had one line for this! if csv.read.include?(new_student)
  ruby_already = false
  csv.each do |row|
    if row.include? "Ruby"
      ruby_already = true
    end
  end


  # if you're in r+ mode and want to write to the top, you'll have to rewind here
  # csv.rewind

  # Kari L says: read it backwards: csv << new_student unless ruby_already
  unless ruby_already # if not ruby_already
    csv << new_student # best
  end

  # csv.concat(new_student) # next best
  # csv += new_student # last best

  # csv.rewind # moves cursor back to top

  # in a/append mode, always adds to end of file, even if you move up to top!
  # csv << new_student

  # csv.rewind # so if you want to then read from the top, you have to rewind
  # ap csv.read

  # csv.rewind
  # ap csv.read.last
end

cohort = CSV.open("../../c3-contact-info~.csv", 'r', headers: true)

cohort.each do |row|
  puts "\n\nNEXT ROW\n\n"
  row.each do |header, cell|
    puts "#{ header }:".colorize(:green) + " #{ cell }".colorize(:blue)
  end
end
