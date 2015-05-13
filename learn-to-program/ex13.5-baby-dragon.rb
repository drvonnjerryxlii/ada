# this was a group project! four to a group. :)

class BabyDragon
  attr_accessor :name

  def initialize(name, color)
    @asleep             = false
    @hydration_level    = 10 # 0: thirtsy, 10: fully hydrated
    @name               = name
    @stuff_in_intestine = 0 # 0: empty, 8-10: has to poo
    @suddenly           = "They wake up suddenly!"

    @color              = color.downcase # red, blue, green
    if @color == "red"
      @stuff_in_belly   = 5
    else
      @stuff_in_belly   = 10 # 0: hungry, 10: full
    end

    puts "#{ @name } is born!"
  end


  # baby friendly activities
  def feed
    puts "You feed #{ @name }."

    if @color == "red"
      @stuff_in_belly = 5 #only fills halway
    else
      @stuff_in_belly = 10 # belly full!
    end

    passage_of_time
  end


  def water
    puts "You gave #{ @name } water."
    @hydration_level = 10
    passage_of_time
  end


  def walk
    puts "You walk #{ @name }."

    if @color == "blue"
      puts "You are surprised that a dragon poops such a small amount!"
      @stuff_in_intestine /= 2

    else
      @stuff_in_intesine = 0
    end

    passage_of_time
  end


  def put_to_bed
    puts "You put #{ @name } to bed."
    @asleep = true

    3.times do
      if @asleep
        passage_of_time
      end

      if @asleep # if dragon continues to sleep
        puts "#{ @name } snores, filling the room with smoke."
      end
    end

    if @alseep
      @alseep = false
      puts "#{ @name } wakes up slowly."
    end
  end


  def toss
    puts "You toss #{ @name } up into the air (carefully)."
    puts "They giggle, which singes your eyebows!"

    if @color == "green"
      @stuff_in_intestine = 0
      puts "#{ @name } got too exited and lost control. On your shirt."
    end

    passage_of_time
  end


  def rock
    puts "You rock #{ @name } gently, with great affection."
    @asleep = true

    puts "They briefly doze..."
    passage_of_time

    wakes("...but wakes when you stop.")
  end




  private # anything defined after "private" or "protected" cannot be
  # called outside of the class!


  def wakes(why_message)
    if @asleep # wake up dragon
      @asleep = false
      puts why_message # tell user why dragon woke up
    end
  end


  def hungry?
    # dragons get hungry when their stomachs are 80% empty
    @stuff_in_belly <= 2
  end


  def thirsty?
    # dragons get thirsty when their hydration is 20% or less
    @hydration_level <= 2
  end


  def poopy?
    # dragons have to poo when their intestines are 80% full
    @stuff_in_intestine >= 8
  end


  def passage_of_time
    check_belly_intestines
    check_dehydration

    check_hungry_level
    check_poopy_level
    check_thirsty_level
  end


  def check_dehydration
    # deincrement water
    if @hydration_level > 0
      @hydration_level -= 1
      # dragons don't pee, because water is a necessary element to keep them
      # from combusting / to calm the fires
    end

    # consequence if no water left
    if @hydration_level <= 0
      puts "The fire inside #{ @name } overwhelms its system and it combusts."
      puts "Your dragon is dead. :("
      exit
    end
  end


  def check_belly_intestines
    # if food, move it from belly to intestines
    if @stuff_in_belly > 0
      @stuff_in_belly -= 1
      @stuff_in_intestine += 1

    # consequence if not enough in belly
    else
      wakes(@suddenly)

      puts "#{ @name } is starving! In desperation, they eat you!" # :(

      exit
    end

    # consequence if too much in intestines
    if @stuff_in_intestine >= 10
      puts "Eww! #{ @name } had an accident. :("
      @stuff_in_intestine = 0
    end
  end


  def check_hungry_level
    # warn user if low
    if hungry?
      puts "#{ @name }'s stomach grumbles (ominously)..."
      wakes(@suddenly)
    end
  end


  def check_poopy_level
    # warn user if low
    if poopy?
      puts "#{ @name } does the potty dance..."
      wakes(@suddenly)
    end
  end


  def check_thirst_level
    # warn user if low
    if thirsty?
      wakes(@suddenly)
      puts "#{ @name }'s plant died!"
    end
  end
end
