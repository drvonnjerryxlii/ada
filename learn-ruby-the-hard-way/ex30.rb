people = 42
cars = 20
trucks = 20


if cars * 4 > people
	print "We could take the cars, "

	if trucks * 3 > people
		puts "or we could take the trucks."
		puts "Either way, at least nobody has to sit outside!"
	elsif trucks * 8 > people
		puts "or we could take the trucks ~~if some people sit in the back!"
		puts "Let's take the cars unless the weather's nice!"
	else
		puts "but we don't have enough trucks."
		puts "I guess we're taking the cars!"
	end

elsif cars * 4 > people	
	print "We don't have enough cars, "

	if trucks * 3 > people
		puts "but we do have enough trucks!"
		puts "We'll take the trucks."
	elsif trucks * 8 > people
		puts "but we do have enough trucks if some people sit in the back!"
		puts "Let's take the trucks!"
	else
		puts "and we don't have enough trucks, either."
		puts "I guess we're staying home."
	end

else
	puts "We can't decide."

end