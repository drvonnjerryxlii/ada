

#                    * * * * * * * * * * * * * * * *
#                    *                             *
#                    *   Random  Menu  Generator   *
#                    * Dr. Vonn Jerry XLII edition *
#                    *                             *
#                    * * * * * * * * * * * * * * * *


# Notes:
#
# 1. I misread the menu thing as serve up any kind of random menu thing. I went
#    back later and added food arrays but preserved the original content. This
#    has added a funny new element to the program.
#
# 2. I really enjoyed the spoken element that Victoriya added to her calculator
#    project, so I decided to add a spoken word feature to this program. This
#    feature for mac users actually seems pretty useful, because you could start
#    the program and then walk over to various cabinets to check for ingredients
#    while the program is reeling off the resultant list.
#
# 3. I decided pretty quickly that I wanted to make something I would use again,
#    so this is a beast. I rock?
#
# Enjoy!
#    --Jeri / @drvonnjerryxlii




# GOLD GOLD GOLD GOLD GOLD GOLD GOLD GOLD GOLD GOLD GOLD GOLD GOLD GOLD GOLD
#
# Expand your solution to ensure that no descriptive term in a menu item is
# ever {"} repeated. SORT OF
#
# Expand your solution to allow the user to determine how many items they'd
# like to see via user input. YES

# PLATINUM PLATINUM PLATINUM PLATINUM PLATINUM PLATINUM PLATINUM PLATINUM
#
# Instead of using hardcoded or predefined arrays, make your program accept
# user input. Then generate menu items from the user provided input. You'll
# need to prompt for and store a varying number of entries for each array.



#------------------------- BEGIN WEIRD GLOBAL THINGS ---------------------------

$voice = false # don't speak
$individual = true # aka not combination
$what_kind_of_plans_desired = nil # what can I say? I don't have any plans yet.
$how_many_plans_desired = 0 # and I don't want any, either!
$user_wants_too_many = false # zero just doesn't know how to be too many.

#-------------------------- END WEIRD GLOBAL THINGS ----------------------------
#--------------------- BEGIN OUTPUT TEXT TO USER THINGS ------------------------

def speak(string_to_speak)
  puts "#{string_to_speak}"

  if $voice # originally included Good News, but it says "News" / or something every time X_x
    good_voices = ["Alex", "Vicki", "Zarvox"]
    random_voice = good_voices[(rand * 3)]
    # say -v "voice name" "text to say"
    %x{say -v #{random_voice} #{string_to_speak}}
  end
end

#---------------------- END OUTPUT TEXT TO USER THINGS -------------------------
#----------------------------- BEGIN HELP THINGS -------------------------------

# this isn't being used yet. eventually, there should be a help function here.
def help_user
  speak("I can't help you.")
end

#------------------------------ END HELP THINGS --------------------------------
#----------------- BEGIN VERIFICATION / CONFIRMATION THINGS --------------------

def request_user_confirmation
  user_continue = $stdin.gets.chomp.downcase

  if user_continue.include? "n"
    return false
  elsif user_continue.include? "y"
    return true
  else
    possible_responses = [true, false]
    random_choice = (rand * 2).floor
    return possible_responses[random_choice]
  end
end




def verify_feeling(user_feeling)
  bored = %w{good bad lazy well upset bored hotdog elephant tacos}
  hungry = %w{hung angry peckish eat food dinner lunch breakfast dessert snack dish}
  talky = %w{speak word spoke say speech talk said}
  #star = %w{star you}
  #help = %{help what how when why where who}

  talky.each do |feeling|
    if user_feeling.include? feeling
      $voice = true
    end
  end

  # help.each do |feeling|
  #   if user_feeling.include? feeling
  #     help_user
  #   end
  # end

  bored.each do |feeling|
    if user_feeling.include? feeling
      $individual = true
      return retrieve_plans("bored")
    end
  end

  hungry.each do |feeling|
    if user_feeling.include? feeling
      $individual = false
      return retrieve_plans("dishes")
    end
  end

  speak("You said #{user_feeling}. I'm sorry. I don't understand that emotion yet.")
  speak("Until I learn your emotion, I will interpret that as hungry / angry.")
  $individual = true
  return retrieve_plans("hungry")
end




def verify_number(user_number)
  if user_number.include? " "
    user_number.strip!
  end
  while user_number.include? ","
    user_number.slice!(",")
  end

  if (user_number > "/") && (user_number < ":")
    return user_number.to_i
  else
    speak("You said #{user_number}. That doesn't look like a number to me.")
    speak("Please provide your number in numeric format (eg, 12, -4,003.13).")
    return verify_number($stdin.gets.chomp)
  end
end

#------------------ END VERIFICATION / CONFIRMATION THINGS ---------------------
#------------------------- BEGIN FORMAT DATA THINGS ----------------------------

def assign_max_value(array_of_plans)
  a, b, c = array_of_plans[0].length, array_of_plans[1].length, array_of_plans[2].length

  if (a <= b) && (a <= c)
    return a
  elsif (b <= c) && (b <= a)
    return b
  else # (c <= a) && (c <= b)
    return c
  end
end

#-------------------------- END FORMAT DATA THINGS -----------------------------
#--------------------- BEGIN REDONKULOUS DATABASE THING ------------------------

def retrieve_plans(which_plans, user_plans=nil)
  texture_flavor = [ # 10
    "creamy", "hot", "soft", "crunchy", "sweet", "salty", "savory", "herbed",
    "spicy", "mild"
  ]

  preparation = [ # 13
    "sauteed", "steamed", "boiled", "deep-fried", "baked", "toasted",
    "slow-cooked", "tossed", "raw", "stuffed", "diced", "dried", "sprouted"
  ]

  ingredient = [ # 12
    "crab", "eggs", "tacos", "dumplings", "zucchini / courgette", "pineapple",
    "pear", "mushrooms", "sweet potato", "cabbage", "mung beans", "rice"
  ]

  dishes_max = assign_max_value([texture_flavor, preparation, ingredient])
  dishes = [texture_flavor, preparation, ingredient, dishes_max]

  protein = [ # good sources of protein. inclusion cutoff is 10% of daily value,
              # based on whfoods-stated serving size from chart found 2015may8
              # at http://whfoods.org/genpage.php?tname=nutrient&dbid=92#foodchart
    # animals
    "tuna", "cod", "chicken", "turkey", "salmon", "beef", "shrimp", "lamb",
    "scallops", "sardines",

    # animal products
    "yogurt", "cheese", "eggs",

    # whole plants (& whole plant parts like seeds and legumes)
    "soy beans", "spinach", "lentils", "dried peas", "pinto beans",
    "kidney beans", "black beans", "navy beans", "lima beans",
    "chickpeas / garbanzo beans", "pumpkin seeds", "peanuts", "green peas",
    "oats", "collard greens",

    # plant products
    "tofu", "tempeh"
  ]

  fiber = [ # good sources of fiber. inclusion cutoff is 10% of daily value,
            # based on whfoods-stated serving size from chart found 2015may8
            # at http://whfoods.org/genpage.php?tname=nutrient&dbid=59#foodchart
    # whole plants (& whole plant parts like seeds and legumes)
    "navy beans", "raspberries", "collard greens", "turnip greens",
    "beet greens", "dried peas", "lentils", "pinto beans", "black beans",
    "lima beans", "kidney beans", "barley", "wheat", "green peas",
    "winter squash", "pears", "broccoli", "cranberries", "spinach",
    "brussels sprouts", "green beans", "cabbage", "flaxseeds", "swiss chard",
    "asparagus", "carrots", "oranges", "strawberries", "mustard greens",
    "fennel", "cauliflower", "kale", "summer squash", "eggplant / aubergine",
    "chickpeas / garbanzo beans", "soy beans", "avocados", "rye",
    "sweet potatoes", "quinoa", "papayas", "buckwheat", "apples", "olives",
    "sesame seeds", "oats", "potatoes", "blueberries", "beets", "banana",
    "onions", #"almonds", # although almonds qualify, I reject them on the
                          # grounds of their extremely high water usage.

    # plant products
    "cinnamon", "tempeh"
  ]

  fat = [ # good sources of fat. inclusion cutoff is 10% of daily value, based
          # on whfoods-stated serving size from chart found 2015may8 at
          # http://whfoods.org/genpage.php?tname=nutrient&dbid=84#foodchart
          # also included: several items listed in an article discussing
          # macronutrients at http://whfoods.org/genpage.php?tname=faq&dbid=7#health
    # animals
    "sardines", "salmon", "beef", "shrimp",

    # whole plants (& whole plant parts like seeds and legumes)
    "flaxseeds", "walnuts", "brussels sprouts", "cauliflower", "mustard seeds",
    "soy beans", "avocados", "cashews",

    # plant products
    "tofu", "olive oil", "canola oil"
  ]

  delicious = [ # source: my tongue
    # sweet
    "nutella", "honey", "milk", "chocolate", "dragonfruit", "mangos",
    "blackberries",

    # savory
    "nutritional yeast", "arugula", "pasta", "rosemary", "curry", "coconut oil",
    "natto", "sauerkraut", "bratwurst", "seaweed", "ramen", "soup", "pepper",
    "turmeric", "garlic", "scallions", "radishes", "cucumber", "cumin", "basil",
    "oregano", "marjoram", "kefir",

    # unsavory
    "beer", "cider", "vodka", "rum", "coffee", "tea", "milk tea",

    # miscellaneous horror / not delicious things to add a slight taste of WTF to the generator
    "eye of newt", "fingernails", "a few loose hairs", "a bug",
    "a small piece of plastic", "a bandaid", "a bowl of teeth", "chips", "ice",
    "a dragon", "a coin", "a penny", "an eyelash", "a tiny feather",
    "the shiniest rock"
  ]

  food = [protein, fiber, fat, delicious]

  # animals
  # animal products
  # whole plants (& whole plant parts like seeds and legumes)
  # plant products

  recreation = [
    "Go fly a kite. Up to the highest height.", # I hope that song gets stuck in your head!
    "Take your bike out on a really long ride. That's always fun!", # well, unless it's raining or you don't have water
    "Find a ride out to Poo Poo Point, and go hiking while making inappropriate jokes about its name.", # rude!
    "Learn about the brain. BRAINSTEM, BRAINSTEM.", # I hope that gets stuck in your head, too!

    "Organize $20 thrift store run with a few friends that culminates in a white elephant party.", # why are they called that, anyway?
    "Take over the world.", # I mean... there are twelve other ideas about this concept.....
    "Program something.", # there might by twelve ideas about this, too....
    "Learn to play an instrument!", # this will probably take more than one afternoon

    "Get crafty! Hang around in dark corners with a trenchcoat. Try to look as suspicious as possible.", # punny? attempted punny.
    "Scream \"Bllllaaarrrrrrrrgggggggghhhhhh!\" No, seriously. Scream it right now! You'll feel better. I promise.", # I can't wait to hear the computer read this one
    "Jog around the block.", # exercise!
    "Find the nearest coffee shop or cafe and order the weirdest thing you can find on the menu." # also, ingest it. it's probably delicious.
  ]

  world_domination = [ # thanks to pinky & the brain for most of these!
    # http://en.wikipedia.org/wiki/List_of_Pinky_and_the_Brain_episodes
    "Use a growing ray to make yourself into a giant monster. Threaten to destroy the world if you can't rule it.",
    "Assassinate everyone between you and the current leader of the world.",
    "Make friends with everyone between you and the current leader of the world and convince them to vote for you.",
    "Build a giant destructo-robot, and use it to remove all other seats of government from competition.",

    "Create a slow-acting poison, and only give out the antidote after you've received the world's crown.",
    "Stage an accident at your place of work, suing the company for enough money to fund your world domination plans.",
    "Fabricate documents proving the existence of a fictional island nation, and use that to extract billions of dollars in foreign aid.",
    "Use hynotism to trick everyone into voting for you in the next World Ruler election.",

    "Become a celebrity, and use your fame to convince people to take over the world for you & then hand it over.",
    "Move to another world and declare yourself its new leader.",
    "Turn the Lincoln Memorial into a death ray. Cackle evilly as they cart you away.",
    "Sneak into Area 51 to find some alien technology that will ease your path to world domination."
  ]

  programming_projects = [
    "Make a database to track all the board games that are floating around your friends group.",
    "Recreate a two-player card game for local gameplay.",
    "Craft a goat facts mobile app!",
    "Redesign Airbnb's home page.",

    "Create a new game from scratch based around the color purple and the shape of a water bottle.",
     "Design a system for running and tracking the results of tic-tac-toe tournamets.",
    "Bike parking in Seattle! Where is it? Does it suck? Make that app.",
    "Build a Pinky and the Brain random facts app.",

    "Reprogram a roomba.",
    "Make a clone of angry birds!",
    "Write an app based around the concept of abract art and the word Pinkasso.",
    "Write a voice-to-speech interpreter, which will take in the words said and output the words in Morgan Freeman's typical voice and syntax."
  ]

  activities = [recreation, programming_projects, world_domination]

  if which_plans == "hungry"
    return food

  elsif which_plans == "bored"
    return activities

  elsif which_plans == "dishes"
    return dishes

  else
    speak("ERRRROOROOO")
    return food
  end
end

#---------------------- END REDONKULOUS DATABASE THING -------------------------
#-------------- BEGIN DATABASE RETRIEVE, PICK, & DISPLAY THINGS ----------------

def select_random_plans(array_of_plans, how_many_plans_desired)
  $user_wants_too_many = false
  random_selection_of_plans = []
  number_of_plans = 0

  if $individual
    # puts "I am about to select individual plans!" #test !T
    array_of_plans.flatten!.uniq!
    number_of_plans += array_of_plans.length
  else
    # puts "I am about to select individual plans!" #test !T
    number_of_plans += array_of_plans[3]
  end


  # handling case: user wants more things than exist
  if how_many_plans_desired > number_of_plans
    how_many_plans_desired = number_of_plans
    $user_wants_too_many = true
  end

  # handling case: individual items
  if $individual
    # puts "I am selecting individual plans!" #test !T
    until random_selection_of_plans.length == how_many_plans_desired
      which_random_index = (rand * array_of_plans.length).floor
      which_random_plan = array_of_plans.slice!(which_random_index)
      random_selection_of_plans.push(which_random_plan)
    end
  # handling case: combination items
  else
    # puts "I am selecting combo plans!" #test !T
    count = 0
    3.times do
      random_selection_of_plans.push([])
      from = array_of_plans[count]
      to = random_selection_of_plans[count]
      until to.length == how_many_plans_desired
        which_random_index = (rand * from.length).floor
        which_random_plan = from.slice!(which_random_index)
        to.push(which_random_plan)
      end
      count += 1
    end
  end

  return random_selection_of_plans
end




def display_plans(plans)
  press_enter = "\nPress enter/return to continue or control+c to quit."
  number_of_plans = 0

  # set number of plans for individual plans
  if $individual
    # puts "I will display individuals" #test !T
    number_of_plans = plans.length
  # set number of plans for combination plans
  else
    # puts "I will display combos" #test !T
    number_of_plans = plans[0].length
  end

  # handle case: user wants more things than exist
  if $user_wants_too_many
    # explains to user why more items aren't being displayed
    speak("You wanted more ideas than I had available.")
    speak("I only have #{number_of_plans} ideas in my datasets.")
  end

  # introduces things
  speak("Here are your #{number_of_plans} ideas.")
  speak("May they inspire you to do great things!")

  # warns user about display method if large number of plans
  if number_of_plans > 10
    speak("I will display these for you ten at a time.")
  end

  # handling individual dispays
  if $individual
    # puts "I am individual being displayed!" #test !T
    count = 0
    plans.each do |plan|
      count += 1
      speak("#{count}. #{plan}")
      if count % 10 == 0 && count != plans.length
        speak(press_enter)
        $stdin.gets
        speak("Okay! Here is the next set of ideas.")
      end
    end
  # handling combination displays
  else
    # puts "I am combination being displayed!" #test !T
    count = 0
    number_of_plans.times do
      speak("#{count + 1}. #{plans[0][count]} #{plans[1][count]} #{plans[2][count]}")
      count += 1
      if count % 10 == 0 && count != plans.length
        speak(press_enter)
        $stdin.gets
        speak("Okay! Here is the next set of ideas.")
      end
    end
  end

  speak(press_enter)
  $stdin.gets
end

#---------------- END DATABASE RETRIEVE, PICK, & DISPLAY THINGS ----------------
#--------------------- BEGIN USER CREATE OWN DATASET THINGS --------------------

def verify_user_plans_type

end


def create_user_plans
  speak("So you want to create your own dataset, huh? Do you know how to do that?")
  if request_user_confirmation
    speak("Do you want to store your data in single entries like so:")
    speak("One entry: 'Make nachos.' Second entry: 'Go to the store.'")
    speak("Third entry: 'Jog around the block.' Fourth entry: 'Take a picture of something blue.'")
    speak("Fifth entry: 'Buy a new camera.' Sixth entry: 'Watch a movie!'")
    speak("Possible result: '1. Watch a movie!' '2. Go to the store.'")
    speak("Or do you want to store your data in multiple entries like so:")
    speak("One entry: 'soft', Second entry: 'boiled', Third entry: 'egg',")
    speak("Fourth entry: 'spicy', Fifth entry: 'sauteed', Sixth entry: 'chicken'.")
    speak("Possible result: '1. soft sauteed egg', '2. spicy boiled chicken'.")
  end

  speak("Do you want individual or combination sets?")



end



#---------------------- END USER CREATE OWN DATASET THINGS ---------------------
#-------------- BEGIN GETTING THE EVERYTHING ELSE RUNNING THINGS ---------------

# this is sort of a beast, because I wanted to have it call itself but didn't
# want to repeat unnecessary questions, etc
# run_plans_machine asks for some user input about what plans to acquire and
# how many of them to fetch, and then it calls a couple find & display units
def run_plans_machine(skip_feeling)
  # these variables need to exist outside the loops
  skip_how_many = false


  # the beginning of complicated recursive call logic <-- right/wrong terminology?
  # basically, if the user doesn't want a new type of plans, the fist block can
  # be skipped.
  if !skip_feeling # unless skip_feeling (counterintuitive to me)
    # find out what plans to get by calling verify_feeling on user input
    speak("How are you feeling?")
    $what_kind_of_plans_desired = verify_feeling($stdin.gets.chomp.downcase)

  else
    # ask if the user would like more plans
    speak("Would you like some new ideas?")
    # checks if user wants to continue receiving ideas.
    # - if not, tells the next block (re: asking how many ideas) to skip itself.
    if request_user_confirmation
      # asks if the user would like different plans.
      # - if yes, makes a recursive call with normal conditions,
      #   which won't skip the feelings block.
      # - if not, makes a recursive call with altered conditions,
      #   which will skip the feelins block.
      speak("Do you have a different feeling?")
      if request_user_confirmation
        run_plans_machine(false)
      else
        run_plans_machine(true)
      end

    else
      skip_how_many = true
      speak("Goodbye then! I hope you found inspiration.")
    end
  end

  # this needs to be skipped sometimes because of the recursive calls above.
  if !skip_how_many # unless skip_how_many (counterintuitive to me)
    # find out how many plans to get
    speak("How many ideas would you like?")
    $how_many_plans_desired = verify_number($stdin.gets.chomp)

    # finally, the plans can be displayed to the user! this statement is a bit
    # of a mouthful: it calls display_plans on the result of select_random_plans.
    # handling combination items
    if $what_kind_of_plans_desired == "dishes"
      display_plans(select_random_plans($what_kind_of_plans_desired, $how_many_plans_desired))
    # handling individual items
    else
      display_plans(select_random_plans($what_kind_of_plans_desired, $how_many_plans_desired))
    end

    # then, calls itself recursively in case the user wants to play again.
    run_plans_machine(true)
  end

end




# this is separate because I didn't want to make another level of skip this
# thing or use a global variable
def start_plans_machine
  # says hello to user
  speak("Hi! My name is Start Plans Machine, but you can call me Star for short.")
  run_plans_machine(false)
end

#--------------- END GETTING THE EVERYTHING ELSE RUNNING THINGS ----------------
#------------------------ BEGIN TRIGGER THE EVERYTHING -------------------------

start_plans_machine

#-------------------------- END TRIGGER THE EVERYTHING -------------------------
