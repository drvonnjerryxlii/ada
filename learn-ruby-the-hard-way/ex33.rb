# -*- coding: utf-8 -*-

def printNumbers(start,stop,increment)
	numbers = []
	start.step(stop,increment) { |i| numbers.push(i) }
	puts "The numbers: "
	numbers.each { |num| print num.to_s + " " }
	print "\n"
end

printNumbers(0,6,2)