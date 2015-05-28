require 'benchmark'

def factorial_recursive(num)
  return "Cannot calculate factorial of a negative number." if num < 0

  if num <= 1
    1
  else
    num * factorial(num - 1)
  end
end


def factorial_iterative(num)
  if num <= 0 # guard clause.
    puts "error message: we hate your number."
    return
  end

  result = 1

  until num <= 1
    result *= num
    num -= 1
  end

  return result
end


time_r = 0 # time for recursion
time_i = 0 # time for iteration

time_i = Benchmark.realtime do
  10.times { fac_i = factorial_iterative(50000) }
end

time_r = Benchmark.realtime do
  10.times { fac_r = factorial_iterative(50000) }
end

puts "Iterative took: #{ time_i } seconds."
puts "Recursive took: #{ time_r } seconds."
