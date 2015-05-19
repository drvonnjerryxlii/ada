# hmmm, as an example for understanding the differences between classes and
# modules, we wrote some harry potter fanfiction in class.

module HarryPotter

  class Robe
    def initialize(color="black")
      @color = color
    end

    def wear
      puts "You wear that #{ @color } robe so well! #{ @color.capitalize } looks great on you."
    end
  end


  class Hat
    def initialize(color="black")
      @color = color
    end

    def wear
      puts "You wear that #{ @color } wizard hat so well! #{ @color.capitalize } looks great on you."
    end
  end


  class Person
    attr_accessor :favorite_hat, :favorite_robe, :wand
    attr_reader :hat, :name, :robe

    def initialize(favorite_color, name)
      @hat = Hat.new(favorite_color)
      @name = name
      @robe = Robe.new(favorite_color)
    end

    def speak
      puts "Hi! I'm #{ name }."
    end

    def wear_hat
      @hat.wear
    end

    def wear_robe
      @robe.wear
    end
  end


  class Wizard < Person
    attr_accessor :familiar

    def initialize(color, name)
      super(color, name)
      @magic = true
    end

    def cast(spell)
      if @wand
        case spell
        when "invisibility"
          puts "#{ @name } disappears from view."
        when "fire"
          puts "#{ @name } conjures a ball of fire."
        when "flight"
          puts "#{ @name } leaps into the air but doesn't come back down."
        else
          puts "#{ @name } whips out wand made of #{ @wand.wood }, but nothing happens."
        end
      else
        puts "#{ @name } can't cast spells without a wand!"
      end
    end

    def magic?
      return @magic == true
    end
  end


  class Mundane < Person
    attr_accessor :computer, :pet, :wand

    def initialize(color, name)
      super(color, name)
      @magic = false
    end

    def cast(spell)
      if @wand
        puts "#{ @name } has a cool wand made of #{ @wand.wood }. It's #{ @wand.length } long!"
      else
        puts "#{ @name } doesn't have a toy wand to cast spells with."
      end
    end

    def code(program)
      if @computer
        case program
        when "game"
          puts "#{ @name } just finished coding up a new game!"
        when "mobile app"
          puts "#{ @name } is working on a mobile app right now."
        when "flight"
          puts "#{ @name } has to run to catch a flight down to the San Francisco office."
        else
          puts "#{ @name } whips out a fancy #{ @computer }, but nothing happens."
        end
      else
        puts "#{ @name } can't write programs without a computer!"
      end
    end

    def magic?
      return @magic == true
    end
  end


  class Wand
    def initialize(wand_hash)
      @length = wand_hash[:length]
      @wood = wand_hash[:wood]
    end
  end

end


def test_person(person)
  if person.magic?
    puts "#{ person.name } is a wizard."
  else
    puts "#{ person.name } is not a wizard."
  end
end

unic_orn = HarryPotter::Mundane.new("rainbow", "Unic Orn")
test_person(unic_orn)

unic_orn.robe.wear
unic_orn.wear_robe

unic_orn.code("mobile app")

unic_orn.computer = "Lappier 5000"

unic_orn.code("mobile app")
unic_orn.code("web app")

parry_hotter = HarryPotter::Wizard.new("green", "Parry Hotter")
test_person(parry_hotter)

parry_hotters_robe = HarryPotter::Robe.new("blue")
parry_hotter.favorite_robe = parry_hotters_robe

parry_hotter.wear_robe
parry_hotter.robe.wear
parry_hotter.favorite_robe.wear

parry_hotters_hat = HarryPotter::Hat.new("glitter")
parry_hotter.favorite_hat = parry_hotters_hat

parry_hotter.wear_hat
parry_hotter.hat.wear
parry_hotter.favorite_hat.wear

wand_one = { length: "13 inches", wood: "yew" }
wand_two = { length: "12 inches", wood: "oak" }
wand_three = { length: "10.5 inches", wood: "maple" }
wand_four = { length: "11 inches", wood: "pine" }

available_wands = [wand_one, wand_two, wand_three, wand_four]

parry_hotter.cast("invisibility")

which_random_wand = rand(0...available_wands.length)
parry_hotters_wand = available_wands[which_random_wand]
# !W parry_hotter.wand = Wand.new(parry_hotters_wand)

parry_hotter.cast("fire")
parry_hotter.cast("leviosa")

unic_orn.cast("invisibility")

which_random_wand = rand(0...available_wands.length)
# !W unic_orn.wand = Wand.new(available_wands[which_random_wand])

unic_orn.cast("fire")
