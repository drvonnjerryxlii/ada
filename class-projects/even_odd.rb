a = 5 + 7 * 24 - 16 / 3 + 42 - 6 + 84543 * 3 / 8
b = 4 / 6 + 3 + 5 * 24 * 63 + 16 * 3 / 5 + 41 - 2
c = 13
d = 14




puts "a is 5 + 7 * 24 - 16 / 3 + 42 - 6 + 84543 * 3 / 8"
print "Is a even?"
$stdin.gets
print "#{a.even?}: a is #{a}."
$stdin.gets
puts "and b is 4 / 6 + 3 + 5 * 24 * 63 + 16 * 3 / 5 + 41 - 2"
print "Is b odd?"
$stdin.gets
print "#{b.odd?}: b is #{b}."
$stdin.gets
puts "c is 13"
print "Is c odd?"
$stdin.gets
print "#{c.odd?}: c is #{c}."
$stdin.gets
puts "d is 14"
print "Is d even?"
$stdin.gets
puts "#{d.even?}: d is #{d}."
