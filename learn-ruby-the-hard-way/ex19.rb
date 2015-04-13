# sets encoding to utf8
# -*- coding: utf-8 -*-
# 
# opens definition of cheese_and_crackers function
# & declares two params cheese_count & boxes_of_crackers
# def cheese_and_crackers(cheese_count, boxes_of_crackers)
# prints to term str w/ nested param/var
# 	puts "You have #{cheese_count} cheeses!"
# 	# prints to term str w/ nested param/var
# 	puts "You have #{boxes_of_crackers} boxes of crackers!"
# 	# prints to term given str
# 	puts "Man that's enough for a party!"
# 	# prints to term givn str
# 	puts "Get a blanket.\n"
# marks end of function definition
# end
# 
# prints to term giv str
# puts "We can just give the function numbers directly:"
# calls func w/ two int params
# cheese_and_crackers(20, 30)
# 
# 
# prints to term giv str
# puts "OR, we can use variables from our script:"
# sets var equal to int val 10
# amount_of_cheese = 10
# sets var equal to int val 50
# amount_of_crackers = 50
# 
# calls func w/ two vars decl above
# cheese_and_crackers(amount_of_cheese, amount_of_crackers)
# 
# 
# prints to term giv str
# puts "We can even do math inside too:"
# calls func w/ results of two calcs
# cheese_and_crackers(10 + 20, 5 + 6) # 30, 11
# 
# 
# #prints to term giv str
# puts "And we can combine the two, variables and math:"
# calls func w/ results of two calcs, which both contain var + int
# cheese_and_crackers(amount_of_cheese + 100, amount_of_crackers + 1000) # 110, 1050

def whatYouSay(whatStr, youStr)
	puts "\"#{whatStr},\" said #{youStr}."
end

what1 = "You have no chance to survive. Make your time"
you1 = "a demonic visage"

what2 = "You did not knock correctly. I cannot open for you"
you2 = "Dumbledoor"

what3 = "Alas! "
you3 = "a dashing figure, who upon further consideration you realize is "

whatYouSay(what1,you1)
whatYouSay(what2,you2)
whatYouSay(what3+what2,you3+you2)
whatYouSay(what3+what1,you3+you1)
whatYouSay("Oh noes!","some generic passersby")
whatYouSay(what3*3, you2 + ", " + you3 + you1)
whatYouSay("ARRRRRRGGGGGGgghhh!", you2 * 2)
whatYouSay(you1,what1)
whatYouSay("This is beginning to tire me","Jarg")
whatYouSay("doooooooo dooo doooo doooo doooooo do doood oooooo" * 3, "the loveliest song")