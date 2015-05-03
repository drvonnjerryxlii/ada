# -*- coding: utf-8 -*-

# globals

$name = "Shaun" # default friend name
$prompt = ">> " # user prompt
$pronoun_they = "she" # he they
$pronoun_their = "her" # his their
$pronoun_them = "her" # him them
$pronoun_theirs = "hers" # his theirs
$events = { shout: 0 }
$silence_shout = true
$items = []
# sergey recs class/method

def add_shout
    $events[:shout] += 1
end


def choose(*words)
    print $prompt
    choice = $stdin.gets.chomp.downcase
    count = 1
    
    words.each do |word|
        if choice.include? word
            return count
        end
        count += 1
    end
    
    empty_space
    
    return choice[0].to_i
end


def repeat_choices(hint,untilValue,choices,choiceWords)
    empty_space
    puts hint

    choices.each do |choice|
        puts choice
    end
    
    choice = choose(choiceWords) # !Q results of unpacking choiceWords to args
    
    if choice == untilValue
        repeat_choices(hint,untilValue,choices,choiceWords)
    end
end


def display_choices(room,*choices)
    puts "#{room}"
    
    count = 1
    
    if !$silence_shout
        puts "#{count}. Call out to #{$name}."
        count += 1
    end
    
    choices.each do |choice|
        puts "#{count}. #{choice}"
        count += 1
    end
end


def empty_space
    count = 1
    until count == 2
        print "\n"
        count += 1
    end
end


def game_intro
    empty_space
    print "Hi! Welcome to Finding Shaun. When in doubt, press enter/return."
    $stdin.gets
    print "Good job!"
    $stdin.gets
    puts "I wrote this game for Shan Wallace."
    puts "He knows what he did to deserve this,"
    puts "though he did not deserve that misspelling."
    $stdin.gets
    puts "TO QUIT AT ANY TIME, PRESS CONTROL+C (^C)."
    puts "THERE IS NOT YET ANY SAVE FUNCTIONALITY."
    $stdin.gets
    empty_space
    puts """
    * * * * * * * *
   * FINDING SHAUN *
    * * * * * * * *
      _______________________
     /    _            _     \\
    /_   |_|          |_|    _\\	
      |   _    __      _    |
      |  |_|  |  |    |_|   |     |##
      |       | *|          |     |
    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,

    """

    your_friend
end


def your_friend
    room = "Do you want to change your friend's name? Default is: Shaun."
    choice1 = "Yes, my friend is named something else."
    choice2 = "No, my friend can be named Shaun."
    display_choices(room,choice1,choice2)
    choice = choose("yes","no")
    
    if choice == 1
        puts "What is your friend's new name?"
        print $prompt
        # get name & begin formatting by switching to lowercase & splitting into words
        name = $stdin.gets.chomp.downcase.split(" ")
        # continue formatting by capitalizing first letter of each word
        name.each { |word| word[0] = word[0].capitalize }
        # finish formatting by putting it back together
        $name = name.join(" ")
    end
    
    puts "Okay! Your friend is #{$name}."
    room = "What are #{$name}'s preferred pronouns?"
    choice1 = "He/him."
    choice2 = "She/her."
    choice3 = "They/them."
#     choice4 = "Other (custom)."
    display_choices(room,choice1,choice2,choice3,choice4)
    choice = choose("no","no","no","other")
    
    if choice == 1
        puts "Okay! He/him."
        $pronoun_they = "he"
        $pronoun_their = "his"
        $pronoun_them = "him"
        $pronoun_theirs = "his"
    elsif choice == 2
        puts "Okay! She/her."
        $pronoun_they = "she"
        $pronoun_their = "her"
        $pronoun_them = "her"
        $pronoun_theirs = "hers"
    elsif choice == 3
        puts "Okay! They/them."
        $pronoun_they = "they"
        $pronoun_their = "their"
        $pronoun_them = "them"
        $pronoun_theirs = "theirs"
    elsif choice == 4
        puts "Okay! Custom. JK THIS FEATURE NOT YET EXIST"
        choice = $stdin.gets.chomp
        $pronoun_they = ".."
        $pronoun_their = "..." 
        $pronoun_them = "...."
        $pronoun_theirs = "....."
    end
    
    puts "Let's find #{$name}."
    $silence_shout = false
    front_porch
end


def front_porch
    room = "You think #{$pronoun_they} might be inside the house."    
    choice1 = "Call out to #{$name}."
    choice2 = "Knock on the door."
    choice3 = "Try the handle."
    choice = choose("call","knock","try")
    
    display_choices(room,choice1,choice2,choice3)
    
    choices = ["Call out to #{$name} again.","Walk into the house."]
    choiceWords = ["call", "walk"] # !Q how to unpack this for args?

	if choice == 1
	    print "You shout #{$name}'s name."
	    add_shout
	    $stdin.gets
	    print "But you get no response."
	    $stdin.gets
	    front_porch
	elsif choice == 2
        puts "As you knock on the door the first time, it slides open in front of you."
        repeat_choices(hint,2,entryway,choices,choiceWords)
	else
	    puts "You decide to try the handle, and the door slips open as you twist the knob."
	    repeat_choices(hint,2,entryway,choices,choiceWords)
	end
	
    puts "You stride confidently into the house."
    entryway
end


def entryway
    puts "Do you close the door behind you?"
    puts "1. Of course I close the door!"
    puts "2. No. It's not my house."
    puts "3. It was open already. Why would I close it?"
    choice = choose("close","no","open")
    
    if choice == 1
        puts "As you turn to close the door behind you, you trip over something."
        puts "You crash into the door, and it slams closed with a BANG."
        $events[:front_door] = "slammed"
        puts "Well, if #{$name} is around, at least #{$pronoun_they} definitely knows someone's here!"
        puts "You look down to find a crowbar at your feet. It stares up at you accusingly."
        puts "1. Yell at the crowbar."
        puts "2. Glare back at the crowbar."
        puts "3. Pick up the crowbar."
        choice = choose("yell","glare","pick")
        
        if choice == 1
            puts "After shouting at the crowbar for a few minutes, you remember #{$name}."
            print "You hope #{$pronoun_they} wasn't close enough to hear that insanity."
            $stdin.gets
            puts "Slightly ashamed, you decide to move on with your life and forward into the hallway."
            $events[:crowbar_sentience] = true
        elsif choice == 2
            print "The crowbar doesn't seem impressed with your glare."
            $stdin.gets
            puts "You consider moving on without it.."
            print "But you can't bear to leave a sentient thing behind."
            $stdin.gets
            puts "You apologize to the crowbar for your earlier rudeness."
            puts "Then you reach down to grab it, stuffing it into your back pocket."
            $items.push("crowbar")
            $events[:crowbar_sentience] = true
        else
            puts "You reach down and grab the crowbar, stuffing it into your back pocket."
            $items.push("crowbar")
            $events[:crowbar_sentience] = false
        end
        
    else
        puts "You continue walking into the house without a second glance back at the door."
        print "You hear a creaking sound behind you."
        $stdin.gets
        print "You turn around just in time to catch the door sliding closed."
        $stdin.gets
        print "Ha! You knew you didn't need to close the door!"
        $stdin.gets
        $events[:front_door] = "open"
    end

    puts "You walk through the entryway and into the downstairs hallway."
    downstairs_hallway_front
end


def downstairs_hallway_front
    puts "The hallway stretches out before you, each of its doorways beckoning you."
    puts "Which one do you want search?"
    puts "1. The first door on the left." # stairs_basement_downstairs
    puts "2. The room on the right looks like a living room! Maybe #{$name} is there."
    puts "3. Call out to #{$pronoun_them}."
    puts "4. Go further down the hallway."
    choice = choose("left","right","call","further")

    if choice == 1
        puts "basement stairs"
        stairs_basement_downstairs
    elsif choice == 2
        puts "living room"
        living_room
    elsif choice == 3
        puts "ssshaaaauuuuuuuuun"
        add_shout
        downstairs_hallway_front
    else
        puts "hallway!"
        downstairs_hallway_middle
    end
    
    

    # dining_room
    # kitchen
    # downstairs_bathroom
    # 
end


def downstairs_hallway_middle
    puts "You take a few steps down the hallway and look around."
    puts "You see a few more options:"
    puts "1. The next door on the right." # downstars_bathroom
    puts "2. The room on the left looks like a dining room! Maybe #{$name} is there."
    puts "3. Call out to #{$pronoun_them}."
    puts "4. Go further down the hallway."
    puts "5. Go back up the hallway."
    choice = choose("next","dining","call","further","back")
    
    if choice == 1
        put "a bathroom!"
        downstairs_bathroom
    elsif choice == 2
        puts "you skip into the dining room"
        dining_room
    elsif choice == 3
        puts "You shout at #{$name} some more."
        add_shout
        downstairs_hallway_middle
    else
        puts "You continue into the depths of the hallway."
        downstairs_hallway_end
    end    
end


def downstairs_hallway_end
    puts "You move into the end of the hallway."
    puts "What do you want to do?"
    puts "1. Call out to #{$name}."
    puts "2. The open room on the right looks like it's a kitchen!"
    puts "3. The last door on the right." # stairs_downstairs_upstairs
    puts "4. It looks like there's a door into the back yard! Try that."
    puts "5. Go back up the hallway."
    choice = choose("call","kitchen","last","outside","back")

    if choice == 1
        puts "shaaaaaaan"
        add_shout
        downstairs_hallway_end
    elsif choice == 2
        puts "kitcccchhhheeeeeen"
        kitchen
    elsif choice == 3
        puts "stairs upstairs"
        stairs_downstairs_upstairs
    elsif choice == 4
        puts "FLEE TO THE GREAT OUTDOORS"
        back_door
    else
        puts "you go back up the hallway"
        downstairs_hallway_middle
    end
end


def stairs_basement_downstairs
    puts "You stairs basement <----> downstairs."
end


def living_room
    # do you call out? call_out += 1
    # which door do you want?
    # downstairs_hallway
    # downstairs_bathroom
    "You living room!"
end


def dining_room
    # find d20 under table
    "You dining room!"
end


def kitchen
    puts "You kitchen!"
end


def downstairs_bathroom
    puts "You downstairs bathroom!"
end


def stairs_downstairs_upstairs
    puts "You stairs downstairs <---> upstairs!"
end


def back_door
    puts "You flee outside."
end


def games_room
    puts "You games room!"
end


def guest_bedroom
    puts "You guest bedroom!"
end


def upstairs_hallway
    puts "You upstairs hallway!"
end


def master_bedroom
    puts "You master bedroom!"
end


def en_suite_bathroom
    puts "You master bathroom!"
end


def basement
    puts "YOU BASEMENT DOOM"
end


game_intro