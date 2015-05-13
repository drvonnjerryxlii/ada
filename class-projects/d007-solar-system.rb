# SOLAR SYSTEM
# zomg i am so excited about this <3
# reusing these numbers:
# => https://github.com/drvonnjerryxlii/drvonnjerryxlii.github.io/tree/master/solarSystem

# SUN https://solarsystem.nasa.gov/planets/profile.cfm?Object=Sun&Display=Facts
# AGE http://www.universetoday.com/33740/how-old-is-mercury/ all 4.6bil
# MOONS http://burro.astr.cwru.edu/stu/jupiter_moons.html + google's built-in calculator
# DISTANCE http://www.universetoday.com/15462/how-far-are-the-planets-from-the-sun/

#------------------------------ DEFINE MOON CLASS ------------------------------
class Moon
  attr_reader :age, :day, :exports, :name, :number, :planet, :sentience, :size,
    :year

  def initialize(moon_hash)
    @day                  = moon_hash[:day]
    @distance_from_planet = moon_hash[:distance]
    @exports              = moon_hash[:exports]
    @name                 = moon_hash[:name]
    @number               = moon_hash[:number]
    @sentience            = moon_hash[:sentience]
    @size                 = moon_hash[:size]
    @year                 = moon_hash[:year]
  end

  def orbits(planet_name)
    if planet_name.class == Planet
      planet_name.moons.push(self)
      @planet = planet_name
    else
      puts "Moons can only orbit planets."
    end
  end

  def describe
    puts "This is a moon named #{@name}! It orbits planet #{planet.name}."
    puts "Its primary exports are #{@exports[:primary]}."
  end

end

#----------------------------- DEFINE PLANET CLASS -----------------------------

class Planet
  attr_accessor :moons
  attr_reader :day, :distance, :exports, :name, :sentience, :size, :star,
    :year

  def initialize(planet_hash)
    @day                 = planet_hash[:day]
    @distance            = planet_hash[:distance].round(3)
    @exports             = planet_hash[:exports]
    @moons               = []
    @name                = planet_hash[:name]
    @number              = planet_hash[:number]
    @sentience           = planet_hash[:sentience]
    @size                = planet_hash[:size]
    @year                = planet_hash[:year]
  end

  def describe
    puts "\tPlanet #{@name} is the #{describe_number} planet from the sun,"
    puts "about #{describe_distance} kilometers from good ol' #{@star.name} (on average)."
    puts "It has #{describe_moons}, and could be roughly described as"
    puts "#{describe.sentience}."

    puts "\t#{@name}'s day is slightly shorter than earth standard, coming"
    puts "in at about #{@day}. Its year is compared to earth standard is"
    puts "#{@year}. Hmmm, that's not #{describe_year}."

    puts "In local years, #{describe_local_year} years have passed since the"
    puts "beginning of time. #{@name}'s primary export is #{describe_exports}."

    puts "Anyway, that's all I can tell you right now!"
  end

  def distance_from(something)
    if something.distance > @distance
      distance_au = (something.distance - @distance).round(3)
      result = "#{ @name } is #{distance} AU"
      return result
    elsif something.distance < @distance
      return @distance - something.distance
    else
      return "Are you sure those are different objects?"
    end
  end

  private

  def convert_au_to_miles(au)
    miles = au * 93
    return miles
  end

  def describe_sentience
    if @sentience < 20_000
      return "not very bright"
    elsif @sentience < 100_000
      return "developing basic intelligence"
    elsif @sentience < 20_000_000
      return "having an IQ above that of a housecat, crow, or dog"
    else
      return "the smartest thing this side of the Hyades cluster"
    end
  end

  def describe_distance
    au = @distance_from_star.round(3)
    miles = au * 93

    return "#{ au } astronomical units, or #{ miles } million miles"
  end

  def describe_moons
    if @moons.length == 1
      return "#{@moons.length} moon"
    else
      moonz = "#{@moons.length} moons"
    end
  end

  def describe_number #!W
    if @number == 1
      return "#{@number}st"
    elsif @number == 2
      return "#{@number}nd"
    elsif @number == 3
      return "#{@number}rd"
    else
      return "#{@number}th"
    end
  end

  def orbits(star_name)
    if star_name.class == SolarSystem
      star_name.planets.push(self)
      @star = star_name
    else
      puts "Planets can only orbit stars."
    end

    puts "there are #{@star.planets.length} planets!"
  end

  def describe_day
    if @day < 1
      return "shorter"
    else
      return "longer"
    end
  end

  def describe_year
    rando = ["so bad", "great", "such a big number", "a hotdog"]
    return rando[rand * rando.length]
  end

  def describe_exports
    if @exports
      output = ""
      count = 0
      last = @exports.length - 1

      @xports.each do |export|
        if count == last
          output += "and #{export}"
        else
          output += "#{export}, "
        end
      return output
    end
  end


  # def describe_moons
  #   if @moons.length > 0
  #     puts "There are #{@moons.length} planets orbiting me:"
  #
  #     count = 1
  #     @moons.each do |moon|
  #       puts "#{count}. #{moon.name}"
  #       count += 1
  #     end
  #
  #   else
  #     puts "There are no moons visibly orbiting me."
  #     puts "I might be lonely, or they might be too small for you to see."
  #   end
  # end

  def describe_local_year
    year = star.age / @year
    puts "The current year on #{@name} is #{year} years!"
  end
end

#------------------------------ DEFINE STAR CLASS ------------------------------

class SolarSystem
  attr_reader :age, :day, :exports, :name, :sentience
  attr_accessor :planets

  def initialize(star_hash)
    @age       = star_hash[:age]
    @day       = star_hash[:day]
    @distance_from_star  = 0 # the center of the solar system!
    @exports   = star_hash[:exports]
    @name      = star_hash[:name]
    @planets   = []
    @sentience = star_hash[:sentience]
  end

  def describe_planets
    if @planets.length > 0
      puts "There are #{@planets.length} planets orbiting me:"

      count = 1
      @planets.each do |planet|
        puts "#{count}. #{planet.name}"
        count += 1

        if planet.moons.length > 0
          planet.describe_moons
        end
      end

    else
      puts "There are no planets visibly orbiting me."
      puts "I might be lonely, or they might be too small for you to see."

    end

    return
  end

end

#------------------ ALL MY DATAS LIVE HERE, LOVELY LITTLE DATAS ----------------

def get_known_universe

  #------------SUN---------------
  sun_info = {
    age: 4_600_000_000, # 4.6 billion years
    day: 25.38, # earth days
    distance: 0, # center of the system
    exports: { # flavor text
      [
        "visible light",
        "sheer magnetism",
        "thermonuclear fusion"
      ]
    },
    name: "Sol",
    sentience: 27_013, # flavor text
    size: 109.3 # log? scale compared to earth, same for all objects
  }

  sun = SolarSystem.new(sun_info)

  #----------MERCUERY-------------
  mercury_info = {
    day: 58.646,
    distance: 0.387, # 57mil km 35mil miles (.387AU)
    exports: {
      [
        "hot",
        "cold"
      ]
    },
    name: "Mercury",
    number: 1,
    sentience: 4,
    size: 0.383,
    year: 0.2408467 # (87.97 earth days)
  }

  mercury = Planet.new(mercury_info)
  mercury.orbits(sun)

  #-----------VENUS--------------
  venus_info = {
    day: -243.018, # retrograde
    distance: 0.722, # 108mil km, 67mil mi (.722 AU)
    name: "Venus",
    number: 2,
    sentience: 46_234_008,
    size: 0.95,
    year: 0.61519726
  }

  venus = Planet.new(venus_info)
  venus.orbits(sun)

  #-----------EARTH--------------
  earth_info = {
    day: 0.99726968,
    distance: 1, # 150mil km (93mil mi) (1AU)
    exports: {
      [
        "garbage",
        "radio waves",
        "tiny machines that crash into stuff"
      ]
    },
    name: "Earth",
    number: 3,
    sentience: 3_649,
    size: 1.0,
    year: 1.0000174
  }

  earth = Planet.new(earth_info)
  earth.orbits(sun)

  moon_info = {
    day: 27.322,
    distance: 0.00256955436, # 384,400 km, 238,855mi
    name: "Moon",
    number: 1,
    sentience: 673_158_431,
    size: 0.273,
    year: 0.074803559
  }

  moon = Moon.new(moon_info)
  moon.orbits(earth)

  #------------MARS--------------
  mars_info = {
    day: 1.026,
    distance: 1.52, # 228 mil km (142 mil mi, 1.52AU)
    name: "Mars",
    number: 4,
    sentience: 6_834,
    size: 0.532,
    year: 1.8808476
  }

  mars = Planet.new(mars_info)
  mars.orbits(sun)

  #----------JUPITER-------------
  jupiter_info = {
    day: 0.41354,
    distance: 5.20, # 779mil km, 484mil mi, 5.20AU
    exports: {
      [
        "amazing cloud formations",
        "terrible storms",
        "sophisticated layering systems"
      ]
    },
    name: "Jupiter",
    number: 5,
    sentience: 7_708_434,
    size: 10.97,
    year: 11.862615
  }

  jupiter = Planet.new(jupiter_info)
  jupiter.orbits(sun)

  io_info = {
    day: 1.769,
    distance: 0.00281822091, #AU, 421,600 km, 261,970 mi
    name: "Io",
    number: 1,
    sentience: 16_313,
    size: 0.286,
    year: 0.004843258
  }

  io = Moon.new(io_info)
  io.orbits(jupiter)

  europa_info = {
    day: 3.551181041,
    distance: 0.00448469022, #AU, 670,900 km, 416,878mi
    name: "Europa",
    number: 2,
    sentience: 605_777,
    size: 0.245,
    year: 0.009722108
  }

  europa = Moon.new(europa_info)
  europa.orbits(jupiter)

  ganymede_info = {
    day: 7.15455296,
    distance: 0.00704760702, #AU, 1,070,400 km, 655,116 mi
    name: "Ganymede",
    number: 3,
    sentience: 1_820,
    size: 0.413,
    year: 0.019589322
  }

  ganymede = Moon.new(ganymede_info)
  ganymede.orbits(jupiter)

  callisto_info = {
    day: 16.6890184,
    distance: 0.0125850771, #AU, 1,882,700 km, 1,169,856 mi
    name: "Callisto",
    number: 4,
    sentience: 239,
    size: 0.378,
    year: 0.04569473
  }

  callisto = Moon.new(callisto_info)
  callisto.orbits(jupiter)

  #-----------SATURN-------------
  saturn_info = {
    day: 0.444,
    distance: 9.58, # 1.43bil km, 889mil mi, 9.58AU
    name: "Saturn",
    number: 6,
    sentience: 22_452,
    size: 9.14,
    year: 29.447498
  }

  saturn = Planet.new(saturn_info)
  saturn.orbits(sun)

  titan_info = {
    day: 15.95,
    distance: 0.00816742947, # 1,221,830 km, 759,210mi
    name: "Titan",
    number: 6,
    sentience: 50_075,
    size: 0.404,
    year: 0.4366872
  }

  titan = Moon.new(titan_info)
  titan.orbits(saturn)

  #-----------URANUS-------------
  uranus_info = {
    day: -0.718, # retrograde!
    distance:  19.2, # 2.88bilkm, 1.79bil mi, 19.2AU
    exports: { #!W
      [
        "inappropriate jokes"
      ]
    },
    name: "Uranus",
    number: 7,
    size: 1.0,
    year: 84.016846
  }

  uranus = Planet.new(uranus_info)
  uranus.orbits(sun)

  #-----------NEPTUNE------------
  neptune_info = {
    day: 0.671,
    distance: 30.1, # 4.5bil km, 2.8bil mi, 30.1AU
    name: "Neptune",
    number: 8,
    size: 1.0,
    year: 164.79132
  }

  neptune = Planet.new(neptune_info)
  neptune.orbits(sun)

  triton_info = {
    day: 5.877,
    distance: 0.00237142796, #354,760km, 220438mi,
    name: "Triton",
    number: 1,
    sentience: 142,
    size: 0.212,
    year: 0.016090349
  }

  triton = Moon.new(triton_info)
  triton.orbits(neptune)

  #------------PLUTO-------------
  pluto_info = {
    day: -6.387, # retrograde!
    distance: 39.5, # 5.91bil  km, 3.67bil mi, 39.5 AU
    name: "Pluto",
    number: 9,
    sentience: 1_724_013,
    size: 0.185,
    year: 247.9206
  }

  pluto = Planet.new(pluto_info)
  pluto.orbits(sun)

  return sun
end


def help_user
  help_text = """
You can ask about the sun, the planets (individually or en masse), or any moon
close to the size of pluto. Each of these objects has attributes of their own
that you are welcome to ask about. On specific solar system objects, you can
ask about things like: day, year, local year, and moons.
  """

  puts help_text

  return
end

def check_triggers(triggers, check_here, then_do)
  triggers.each do |trigger|
    if check_here.include? trigger
      return then_do
    end
  end
end



def get_user_input(question)
  puts question
  user_input = $stdin.gets.chomp
  user_input.downcase!

  # check if user needs help
  # help_triggers = %w{help ques ? how why where what who}
  # check_triggers(help_triggers, user_input, help_user)
  puts "you said: #{user_input}"
  return user_input
end


def verify_user_confirmation(question)
  user_confirmation = get_user_input(question)

  if user_confirmation.include? "n"
    return false
  elsif user_confirmation.include? "y"
    return true
  else
    possible_responses = [true, false]
    random_choice = (rand * 2).floor
    return possible_responses[random_choice]
  end
end




def describe_planet
  solar_system = get_known_universe

  # these should be an attribute of their objects, eh? !W
  mercury = %w{merc 1 first one}
  venus = %w{ven 2 second two}
  earth = %w{eart 3 third three}
  mars = %w{mars 4 four forth}
  jupiter = %w{jupi 5 fifth fiv}
  saturn = %w{satur 6 six}
  uranus = %w{uran 7 seven}
  neptune = %w{nept 8 eight}
  pluto = %w{plut 9 ninth nine dwarf}

  triggers = [mercury, venus, earth, mars, jupiter, saturn, uranus, neptune, pluto]

  user_input = get_user_input("What planet would you like to know more about?")
  puts "Great! You want to know more about #{user_input}."
  count = 0
  triggers.each do |trigger|
    if check_triggers(trigger, user_input, true)
      return solar_system.planets[count].describe
    end
    count += 1
  end
end

def describe_moon
end

def describe_sun
end



def verify_user_request(question)
  planet = %w{plan jupi eart merc mars ven uran nept satu plut}
  moon = %w{moon io gany trit tita listo euro}
  sun = %w{sun sol sys}

  user_input = get_user_input(question)

  check_triggers(planet, user_input, describe_planet)
  check_triggers(moon, user_input, describe_moon)
  check_triggers(sun, user_input, describe_sun)

  return
end



def query_solar_system
  verify_user_request("What would you like to know about the solar system?")

  if verify_user_confirmation("Would you like to know something else?")
    return query_solar_system
  else
    puts "Okay. Goodbye! It was nice chatting with your about the solar system."
    return
  end
end


query_solar_system
