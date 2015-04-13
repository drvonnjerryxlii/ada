# -*- coding: utf-8 -*-
# Hahaha, man. I really enjoyed this one. :)


puts "A cough, a burst of feathers, the soft clinking of bells."
print "You pass out..."; $stdin.gets.chomp
print "..."; $stdin.gets.chomp
print "..."; $stdin.gets.chomp
puts "When you awaken, you find yourself in a dark rooom with two doors."
puts "Do you go through door #1 or door #2?"

print "> "
door = $stdin.gets.chomp

if door == "1"
	puts "You stride confidently into the room, closing the door behind you."
	puts "As you turn back around, you notice a giant bear eating a cheese cake."
	puts "You look back. The door is gone. What do you do?"
	puts "1. Reach for the cake."
	puts "2. Scream at the bear."
	
	print "> "
	bear = $stdin.gets.chomp
	
	if bear == "1"
		puts "The bear stares dumbfoundedly at you for a second before rushing to you and clawing your face off."
		puts "The bear licks the remains of the cheese cake off your cooling corpse."
	elsif bear == "2"
	    puts "The bear roars back at you."
	    puts "Frightened, you grab at the space where you think the door used to be."
	    puts "You find the handle, twist, and run out of the room."
	    door = "2"
	else
		puts "In a panic, you try %s instead." % bear
		puts "The bear rushes you and claws your face off."
		puts "As the life slips out of your corpse, you wonder what terrible doom had been stashed behind the other door."
	end
end
	
if door == "2"
	puts "The door slams closed behind you, cutting off all light from the other room."
	puts "You grope in the darkness for a switch, running your hand up and down the wall."
	puts "Your hand brushes against something slimy, and you flinch away."
	puts "A glowing mist begins to seep in from under the door."
	puts "You begin to fear what visage awaits to feast upon your eyes."
	puts "Panicked, you begin shouting nonsense into the dark."
	puts "1. Blueberries."
	puts "2. Yellow jacket clothespins."
	puts "3. Understanding revolvers yelling melodies."
	
	print "> "
	insanity = $stdin.gets.chomp
	
	if insanity == "1" || insanity == "2"
		puts "As the light grows, you realize you are faced with Cthulhu itself."
		puts "Impossible geometries lay themselves out before you."
		puts "A haunting melody begins to play."
		puts "Suddenly, the thought strikes you, did you leave the oven on?"
		puts "You turn to run out of the room only to find yourself unable to lift your legs."
		puts "Eternity stretches out before you."
	else
		puts "As the light grows, you realize you are faced with Cthulhu itself."
		puts "Words rumble up from your belly, and you angrily spit them out."
		puts "\"Ph'nglui mglw'nafh Cthulhu R'lyeh wgah'nagl fhtagn!\" you scream."
		puts "You lose yourself to madness." 
	end

else
	puts "You try to find a way out of this room that doesn't involved the doors."
	puts "You are unsuccessful. Saddened, you open the first door."
	puts "Behind it, you find the haunting visage of a clown's face."
	puts "Its sparkling grin spans from one side of the door to the other."
	puts "You try to run away, but it's too late. A tongue rolls out of the face and grabs you."
	puts "The last thing you think as the clown's teeth begin to crush you: what did the feathers mean?"
end