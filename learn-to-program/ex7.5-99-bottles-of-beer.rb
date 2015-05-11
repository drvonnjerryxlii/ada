# with recursion instead of loop statements
def bottles_of_beer_on_the_wall(how_many_bottles)
  puts "#{how_many_bottles} bottles of beer on the wall."
  puts "#{how_many_bottles} bottles of beer..."
  puts "Take one down and pass it around..."
  how_many_bottles -= 1
  puts "#{how_many_bottles} bottles of beer on the wall."

  if how_many_bottles > 0
    bottles_of_beer_on_the_wall(how_many_bottles)
  else
    puts "We're out of beer!"
  end
end

# calls it
bottles_of_beer_on_the_wall(10)
