#
#
#                   * * * * * * * * * * * * * * * * *
#                   *                               *
#                   *    Random  Menu  Generator    *
#                   *  Dr. Vonn Jerry XLII edition  *
#                   *                               *
#                   * * * * * * * * * * * * * * * * *
#
# Notes:
#
# 1. I really enjoyed the spoken element that Victoriya added to her calculator
#    project, so I decided to add a spoken word feature to this program. This
#    feature for mac users actually seems pretty useful, because you could start
#    the program and then walk over to various cabinets to check for ingredients
#    while the program is reeling off the resultant list.
#
#    *  It won't work for non mac users, and I wasn't sure how to handle that.
#
#    *  And because I felt I was writing this for future me, I probably did not
#       create the best user experience for users other than me. I think this
#       program does a pretty poor job of telling the user what it is doing or
#       what things it knows how to do.
#
# 2. Also, I think this will be a much more useful thingy after we learn how to
#    interact with outside files. The database stuff could be stored in a text
#    file, which would mean items added by the user could be remembered.
#
#    *  On a related note, if you see something like !W !T !R it's probably a
#       note for my future self for the next time I work on this (in case I
#       forget some of the work or tests I wanted to do.
#
# Enjoy!
#    --Jeri / @drvonnjerryxlii


# Expand your solution to ensure that no descriptive term in a menu item is
# ever {"} repeated. SORT OF !Q uniq in list or uniq in soft softish eggs?


#------------------------ BEGIN WEIRD GLOBALy THINGS ---------------------------

VOICE = true # speak until user says not to
INDIVIDUAL = true # aka not combination
WHAT_KIND_OF_IDEAS_DESIRED = nil # what can I say? I don't have any ideas yet.
HOW_MANY_IDEAS_DESIRED = 0 # and I don't want any, either!
USER_WANTS_TOO_MANY = false # zero just doesn't know how to be too many.

#-------------------------- END WEIRD GLOBAL THINGS ----------------------------
#--------------------- BEGIN OUTPUT TEXT TO USER THINGS ------------------------

# outputs provided string of text to terminal & possibly to speakers as well via
# %x interaction with outside terminal environment. !W discovered the hard way
# that say does not take some punctuation well: & ' " \ (
def speak(string_to_speak)
  puts "#{string_to_speak}"

  if VOICE
    good_voices = ["Alex", "Bad", "Good", "Vicki", "Zarvox"]
    random_voice = good_voices[(rand * good_voices.length)]
    %x{say -v #{random_voice} #{string_to_speak}}
  end
end




# checks whether the voice should be toggle from true to false or vice versa by
# looking for specific keywords in a provided string.
def check_reset_voice(user_input)
  voice_triggers = %w{speak word spoke say speech talk tell said}

  voice_triggers.each do |voice_trigger|
    if user_input.downcase.include? voice_trigger
    # input is downcased in case the original get input call expected a number
      if VOICE == true
        VOICE = false
      else
        VOICE = true
      end
    end
  end
end

#---------------------- END OUTPUT TEXT TO USER THINGS -------------------------
#----------------------------- BEGIN HELP THINGS -------------------------------

# would help the user if only it knew how!
# def help_user(user_input)
#   # !W do something to help user here @_@
#   speak("I'm sorry. I don't know how to help you yet.")
#   speak("If you have any questions, please pass them along to Jeri.")
#   speak("She can teach me how to be more helpful!")
# end
#
#
#
#
# # checks whether help_user should be called by looking for specific keywords in
# # a provided string.
# def check_help_request(user_input)
#   help = %{help what how when why where who}
#   help_triggers.each do |help_trigger|
#     if user_input.include? help_trigger
#       return help_user(user_input)
#     end
#   end
# end
#
#------------------------------ END HELP THINGS --------------------------------
#----------------- BEGIN VERIFICATION / CONFIRMATION THINGS --------------------

# gets input from a user, passes the input to check_reset_voice, and then
# returns the user input string back to whatever requested it. because this is
# the only way user input is harvested, any time the user says something it is
# possible to toggle the voice on/off or trigger the currently not-so-helpful
# help_user function (!W). has an option to trigger .downcase! on the user input
# string before returning it.
def get_user_input(downcase)
  user_input = $stdin.gets.chomp

  if downcase
    user_input.downcase!
  end

  check_reset_voice(user_input)
  # check_help_request(user_input) #!W !T

  return user_input
end




# for use after yes/no questions. calls get_user_input, checks for key letters
# in user response, and returns true/false accordingly. returns a random boolean
# response if no key letters found.
def request_user_confirmation
  user_confirmation = get_user_input(true)

  if user_confirmation.include? "n"
    return false
  elsif user_confirmation.include? "y"
    return true
  else
    possible_responses = [true, false]
    random_choice = rand(0...possible_responses.length)
    return possible_responses[random_choice]
  end
end




# checks if a user input string contains any keywords associated with various
# features and then calls the next step for whichever feature.
def verify_feeling(user_feeling)
  creative = %w{creat add update more mine my own}
  hungry = %w{hung angry peckish eat food dinner lunch breakfast dessert snack dish}
  ingredients = %w{gred cook reci assem proc instr}
  world_domination = %w{lazy bored take world hotdog elephant tacos}

  creative.each do |keyword| # create is first, because 'eat' is part of it
    if user_feeling.include? keyword
      return create_user_ideas
    end
  end

  hungry.each do |keyword| # eat is a trigger here, but create has precedence
    if user_feeling.include? keyword
      INDIVIDUAL = false
      return retrieve_ideas("dishes")
    end
  end

  ingredients.each do |keyword|
    if user_feeling.include? keyword
      INDIVIDUAL = true
      return retrieve_ideas("hungry")
    end
  end

  world_domination.each do |keyword|
    if user_feeling.include? keyword
      INDIVIDUAL = true
      return retrieve_ideas("bored")
    end
  end


  speak("You said #{user_feeling}. I'm sorry. I don't understand that emotion yet.")
  speak("Until I learn your emotion, I will interpret that as hungry / angry.") # !W? this is sort of a lie b/c keyboard mismatch w/ name
  INDIVIDUAL = true
  return retrieve_ideas("dishes")
end




# after stripping spaces and commas out a provided string, verifies whether
# said string is qualified to be turned into a number. returns it as an integer
# if so. gives the user a hint and calls itself again if not.
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
    return verify_number(get_user_input(false))
  end
end




# returns the length of the smallest of three arrays within an (outer) array.
# used to assign a max value for the select random ideas function, so it will
# not try to add empty items to a set.
def assign_max_value(array_of_ideas)
  a = array_of_ideas[0].length
  b = array_of_ideas[1].length
  c = array_of_ideas[2].length

  if (a <= b) && (a <= c)
    return a
  elsif (b <= c) && (b <= a)
    return b
  else # (c <= a) && (c <= b)
    return c
  end
end

#------------------ END VERIFICATION / CONFIRMATION THINGS ---------------------
#--------------------- BEGIN REDONKULOUS DATABASE THING ------------------------

# redonkulous database thing. contains three sets of data: dish ideas,
# ingredient ideas, and activity ideas. when called with a string identifying
# a particular dataset, spits out that dataset.
def retrieve_ideas(which_ideas)
  texture_flavor = [
    "creamy", "hot", "soft", "crunchy", "sweet", "salty", "savory", "herbed",
    "spicy", "mild", "pungent", "chunky", "spiced", "rough", "jagged"
  ]

  preparation = [
    "sauteed", "steamed", "boiled", "deep-fried", "baked", "toasted",
    "slow-cooked", "tossed", "raw", "stuffed", "diced", "dried", "sprouted",
    "buttered", "garlic", "rosemary", "curry", "cinnamon", "basil"
  ]

  ingredient = [
    "crab", "eggs", "tacos", "dumplings", "zucchini / courgette", "pineapple",
    "pear", "mushrooms", "sweet potato", "cabbage", "beans", "rice",
    "peppers", "cheese", "mussels"
  ]

  dishes = [texture_flavor, preparation, ingredient]


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
    "the shiniest rock", "two jars"
  ]

  food = [protein, fiber, fat, delicious]


  recreation = [
    "Go fly a kite. Up to the highest height.",
    "Take your bike out on a really long ride.",
    "Find a ride out to Poo Poo Point, and go hiking while making inappropriate jokes about its name.",
    "Learn about the brain. BRAINSTEM, BRAINSTEM.",

    "Organize $20 thrift store run with a few friends that culminates in a white elephant party.",
    "Take over the world.",
    "Program something.",
    "Learn to play an instrument!",

    "Get crafty! Hang around in dark corners with a trenchcoat. Try to look as suspicious as possible.",
    "Scream, Bllllaaarrrrrrrrgggggggghhhhhh! No, seriously. Scream it right now! You will feel better. I promise.",
    "Jog around the block.",
    "Find the nearest coffee shop or cafe and order the weirdest thing you can find on the menu."
  ]

  world_domination = [ # thanks to pinky & the brain for most of these!
    # http://en.wikipedia.org/wiki/List_of_Pinky_and_the_Brain_episodes
    "Use a growing ray to make yourself into a giant monster. Threaten to trample the world if you cannot rule it.",
    "Assassinate everyone between you and the current leader of the world.",
    "Make friends with everyone between you and the current leader of the world and convince them to vote for you.",
    "Build a giant destructo-robot, and use it to remove all other seats of government from competition.",

    "Create a slow-acting poison, and only give out the antidote after you have received enough votes to win.",
    "Stage an accident at your place of work, suing the company for enough money to fund your world domination ideas.",
    "Fabricate documents proving the existence of a fictional island nation, and use that to extract billions of dollars in foreign aid.",
    "Use hypnotism to trick everyone into voting for you in the next World Ruler election.",

    "Become a celebrity, and use your fame to convince people to take over the world for you and then hand it over.",
    "Move to another world and declare yourself its new leader.",
    "Turn the Lincoln Memorial into a death ray. Cackle evilly as they cart you away.",
    "Sneak into Area 51 to find some alien technology that will ease your path to world domination."
  ]

  programming_projects = [
    "Make a database to track all the board games that are floating around your friends group.",
    "Recreate a two-player card game for local gameplay.",
    "Craft a goat facts mobile app!",
    "Redesign the home page of Airbnb. Not sure where to start? Ask codecademy!",

    "Create a new game from scratch based around the color purple and the shape of a water bottle.",
    "Design a system for running and tracking the results of tic-tac-toe tournaments.",
    "Bike parking in Seattle! Where is it? Does it suck? Make that app.",
    "Build a Pinky and the Brain random facts app.",

    "Reprogram a roomba.",
    "Make a clone of angry birds!",
    "Write an app based around the concept of abstract art and the word Pinkasso.",
    "Write a voice-to-speech interpreter, which will take in the words said and output the words in the typical voice and syntax of Morgan Freeman."
  ]

  activities = [recreation, programming_projects, world_domination]


  if which_ideas == "hungry"
    return food

  elsif which_ideas == "bored"
    return activities

  elsif which_ideas == "dishes"
    return dishes
  end
end

#---------------------- END REDONKULOUS DATABASE THING -------------------------
#-------------- BEGIN DATABASE RETRIEVE, PICK, & DISPLAY THINGS ----------------

# takes dataset in array form and a number of ideas wanted from that dataset.
# checks if the dataset is designed for display with individual or multiple
# items on each line. checks for & removes repeat items, then assigns a maximum
# number of items user can request from the dataset. loops through picking
# random items from the dataset until the desired number of items are chosen.
# finally, returns the random items to the requesting function call.
def select_random_ideas(array_of_ideas, how_many_ideas_desired)
  USER_WANTS_TOO_MANY = false
  random_selection_of_ideas = []
  max_value = 0

  # MAX VALUE individual
  if INDIVIDUAL
    # make UNIQUE
    array_of_ideas.flatten!.uniq!
    # final MAX VALUE
    max_value += array_of_ideas.length

  # MAX VALUE combination
  else
    # make UNIQUE
    count = 0
    3.times do
      array_of_ideas[count].uniq!
      count += 1
    end

    # final MAX VALUE
    max_value += assign_max_value(array_of_ideas)
  end

  # adjusts number wanted items if user wants more than exist
  if how_many_ideas_desired > max_value
    how_many_ideas_desired = max_value
    USER_WANTS_TOO_MANY = true
  end


  # RANDOM individual
  if INDIVIDUAL
    until random_selection_of_ideas.length == how_many_ideas_desired
      which_random_index = (rand * array_of_ideas.length).floor
      which_random_idea = array_of_ideas.slice!(which_random_index)
      random_selection_of_ideas.push(which_random_idea)
    end

  # RANDOM combination
  else
    # initialize loop count to zero
    count = 0
    3.times do
      # make space for the items to go into:
      random_selection_of_ideas.push([])

      # these two for readability of following block:
      from_array = array_of_ideas[count]
      to_array = random_selection_of_ideas[count]

      # do actual random selection & move
      until to_array.length == how_many_ideas_desired
        which_random_index = (rand * from_array.length).floor
        which_random_idea = from_array.slice!(which_random_index)
        to_array.push(which_random_idea)
      end

      # increment loop count
      count += 1
    end
  end

  return random_selection_of_ideas
end




# adds flavor text to idea items, and eventually calls speak on them to have
# them output to screen / speakers.
def display_ideas(ideas)
  press_enter = "Press enter/return to continue or control+c to quit."
  number_of_ideas = 0

  # set number of ideas for individual ideas
  if INDIVIDUAL
    number_of_ideas = ideas.length
  # set number of ideas for combination ideas
  else
    number_of_ideas = ideas[0].length
  end

  # handling case: user said zero ideas
  if number_of_ideas == 0
    return request_run_machine_again
  end

  # handling case: user wanted more things than exist. explains to user why more
  # items aren't being displayed
  if USER_WANTS_TOO_MANY
    speak("You wanted more ideas than I had available.")
    speak("I only have #{number_of_ideas} ideas in my datasets.")
  end

  # introduces things
  speak("Here are your #{number_of_ideas} ideas.")
  speak("May they inspire you to do great things!")

  # warns user about display method if large number of ideas to display
  if number_of_ideas > 10
    speak("I will display these for you ten at a time.")
  end

  # handling individual dispays
  if INDIVIDUAL
    count = 0 # keeps track of item/loop number, which is also the index of the item
    ideas.each do |idea|
      count += 1
      speak("#{count}. #{idea}")
      if (count % 10 == 0) && (count != ideas.length)
        speak(press_enter)
        $stdin.gets
        speak("Okay! Here is the next set of ideas.")
      end
    end

  # handling combination displays
  else
    count = 0 # keeps track of item/loop number, which is also the index of the item
    number_of_ideas.times do
      speak("#{count + 1}. #{ideas[0][count]} #{ideas[1][count]} #{ideas[2][count]}")
      count += 1
      if (count % 10 == 0) && (count != ideas[0].length)
        speak(press_enter)
        $stdin.gets
        speak("Okay! Here is the next set of ideas.")
      end
    end

  # goodbye, if block
  end

  # display over
  speak(press_enter)
  $stdin.gets
  # reset user wants too many ideas
  USER_WANTS_TOO_MANY_ideas = false
  return request_run_machine_again
end

#---------------- END DATABASE RETRIEVE, PICK, & DISPLAY THINGS ----------------
#--------------------- BEGIN USER CREATE OWN DATASET THINGS --------------------

# strips some characters that will break the voice. then asks user to verify
# provided string and returns said string if the user confirms its correctness.
# if the user doesn't confirm, asks for a new piece of data & calls itself to
# verify said new piece.
def verify_user_data(piece_user_data)
  chars_voice_doesnt_like = %w{' / ( ) & `}

  chars_voice_doesnt_like.each do |char| # !W find a way to not have to do this?
    while piece_user_data.include? char  # how important is speaking? >_>
      piece_user_data.slice!(char)
    end
  end

  speak("You said: '#{piece_user_data}'. Does that look right?")

  if !request_user_confirmation
    speak("What what you like to add instead?")
    return verify_user_data(get_user_input(false))
  else
    return piece_user_data
  end
end




# creates user data for individual type datasets
def create_user_data_individual
  user_data = []

  # find out how many items to add; somewhat arbitrary limit: 150
  speak("Great! How many items would you like to add?")
  how_many_create = verify_number(get_user_input(false))
  until how_many_create <= 150
    speak("I think that will be a few too many items to type in.")
    speak("Can you pick a smaller number?")
    speak("My largest dataset has 126 items, so pick something close to that!")
    verify_number(get_user_input(false))
  end

  # start adding them!
  until user_data.length == how_many_create
    speak("What what you like to add?")
    temp_storage = verify_user_data(get_user_input(false))
    user_data.push(temp_storage)
  end

  return user_data
end



# creates user data for combination type datasets. offers a hint before creating
# the first item of each inner array. !W use firsts to provide helpful examples?
def create_user_data_combination
  user_data = []

  hints = [
    # hints for creating first words
    [ "This set will be the first word in your generated ideas.",
      "Like -soft- in soft sauteed egg or -spicy- in spicy boiled chicken."
    ],
    # hints for creating middle words
    [ "This set will be the second word in your generated ideas.",
      "Like -sauteed- spicy sauteed egg or -boiled- in soft boiled chicken."
    ],
    # hints for creating last words
    [ "This set will be the last word in your generated ideas.",
      "Like -chicken- in spicy sauteed chicken or -egg- in soft boiled egg."
    ]
  ]

  count = 0 # keep track of which dataset index we're on

  3.times do # !W this can easily be turned into a variable if nec.
    user_data.push([])

    hints[count].each do |hint|
      speak(hint)
    end

    speak("How many items would you like to add to this set? This is set #{count + 1} of 3.")

    how_many_create = verify_number(get_user_input(false))
    until how_many_create <= 50
      speak("I think that's a few too many items to type in.")
      speak("Why don't you pick a smaller number?")
      speak("My largest dataset has 126 items, so pick something closer to a third of that!")
      verify_number(get_user_input(false))
    end

    until user_data[count].length == how_many_create
      speak("What what you like to add?")
      temp_storage = verify_user_data(get_user_input(false))
      user_data[count].push(temp_storage)
    end

    count += 1 # increment to next dataset index when finished
  end

  return user_data
end




# verifies what type of data to create for the user.
def verify_user_ideas_type(user_ideas_type)
  individual = %w{indiv single solo one}
  combination = %w{comb mult many three sev}

  individual.each do |type|
    if user_ideas_type.include? type
      INDIVIDUAL = true
      return
    end
  end

  combination.each do |type|
    if user_ideas_type.include? type
      INDIVIDUAL = false
      return
    end
  end

  speak("#{user_ideas_type} is not a type I understand. Can you say it again differently?")
  speak("I understand idea types like: individual, single, solo, multiple, combo, or several.")
  return verify_user_ideas_type(get_user_input(false))
end




# starts the creation cascade! has a ton of flavor text, since help function is
# not yet helpful (!W).
def create_user_ideas
  speak("So you want to create your own dataset, huh? Do you know how to do that?")
  if !request_user_confirmation
    speak("Do you want to store your data in single entries like so:")
    speak("One entry: 'Make nachos.' Second entry: 'Go to the store.'")
    speak("Third entry: 'Jog around the block.' Fourth entry: 'Take a picture of something blue.'")
    speak("Fifth entry: 'Buy a new camera.' Sixth entry: 'Watch a movie!'")
    speak("Possible result: '1. Watch a movie!' '2. Go to the store.'\n")
    speak("Or do you want to store your data in multiple entries like so:")
    speak("One entry: 'soft', Second entry: 'boiled', Third entry: 'egg',")
    speak("Fourth entry: 'spicy', Fifth entry: 'sauteed', Sixth entry: 'chicken'.")
    speak("Possible result: '1. soft sauteed egg', '2. spicy boiled chicken'.")
  end

  speak("Do you want individual or combination sets?")
  user_data = verify_user_ideas_type(get_user_input(false))
  WHAT_KIND_OF_IDEAS_DESIRED = user_data

  if INDIVIDUAL
    user_data = create_user_data_individual
  else
    user_data = create_user_data_combination
  end

  puts user_data

  speak("How many ideas would you like from your set?")
  how_many_ideas = verify_number(get_user_input(false))

  display_ideas(select_random_ideas([user_data], how_many_ideas))
  return
end

#---------------------- END USER CREATE OWN DATASET THINGS ---------------------
#-------------- BEGIN GETTING THE EVERYTHING ELSE RUNNING THINGS ---------------

# asks user whether a new round of idea generation is in order and either
# restarts the idea generator or says goodbye.
def request_run_machine_again
  speak("Would you like some new ideas?")

  if request_user_confirmation
    return run_ideas_machine
  end

  speak("Goodbye then! I hope you found inspiration.")
  return
end




# asks the user what type of ideas & how many of them to retrieve.
# finally calls display_ideas on the result of calling select_random_ideas
# on the given type and number of ideas.
def run_ideas_machine
  speak("How are you feeling?") # does not necessarily ask in a straightforward way >_>
  WHAT_KIND_OF_IDEAS_DESIRED = verify_feeling(get_user_input(true))

  speak("How many ideas would you like?")
  HOW_MANY_IDEAS_DESIRED = verify_number(get_user_input(false))

  display_ideas(select_random_ideas(WHAT_KIND_OF_IDEAS_DESIRED, HOW_MANY_IDEAS_DESIRED))
  return
end




# says hello to the user & starts the actual machine.
# separate from run ideas machine, because it doesn't need to repeat.
def start_ideas_machine
  speak("Hi! My name is Start Ideas Machine, but you can call me Star for short.")
  run_ideas_machine
end

#--------------- END GETTING THE EVERYTHING ELSE RUNNING THINGS ----------------
#------------------------ BEGIN TRIGGER THE EVERYTHING -------------------------

start_ideas_machine

#-------------------------- END TRIGGER THE EVERYTHING -------------------------
