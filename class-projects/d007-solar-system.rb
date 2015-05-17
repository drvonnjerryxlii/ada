#
#
#                   * * * * * * * * * * * * * * * * *
#                   *                               *
#                   *      Solar System project     *
#                   *  Dr. Vonn Jerry XLII edition  *
#                   *                               *
#                   * * * * * * * * * * * * * * * * *
#
#
# NOTE: If you want to fool around with this in irb/pry/etc, comment out the
#       last line & assign the result of get_known_universe to a variable. There
#       are a lot more things to play with in a toolbox like that. --Jeri
#
# note to self:
#
# * reusing some of these numbers:
#   https://github.com/drvonnjerryxlii/drvonnjerryxlii.github.io/tree/master/solarSystem
#
# * also:
#    * SUN https://solarsystem.nasa.gov/planets/profile.cfm?Object=Sun&Display=Facts
#    * MOONS http://burro.astr.cwru.edu/stu/jupiter_moons.html + google's built-in calculator
#    * AGE http://www.universetoday.com/33740/how-old-is-mercury/ all 4.6bil
#    * DISTANCE http://www.universetoday.com/15462/how-far-are-the-planets-from-the-sun/
#
#--------------------------- begin DEFINE STAR CLASS ---------------------------

class Moon
  attr_reader :day, :exports, :name, :number, :planet, :sentience, :size,
    :year

  def initialize(moon_hash)
    @day           = moon_hash[:day]
    @distance      = moon_hash[:distance]
    @exports       = moon_hash[:exports]
    @name          = moon_hash[:name]
    @number        = moon_hash[:number]
    @sentience     = moon_hash[:sentience]
    @size          = moon_hash[:size]
    @symbol        = moon_hash[:symbol]
    @year          = moon_hash[:year]
  end

  def orbits(planet_name)
    if planet_name.class == Planet
      planet_name.moons[@symbol] = self
    else
      puts "Moons can only orbit planets."
    end
  end

  def describe
    puts "This is a moon named #{ @name }! It orbits planet #{ planet.name }."
    puts "Its primary exports are #{ @exports[:primary] }."
  end

  private

end

#---------------------------- end DEFINE MOON CLASS ----------------------------
#-------------------------- begin DEFINE PLANET CLASS --------------------------

class Planet
  attr_accessor :moons
  attr_reader :day, :distance, :exports, :local_year, :name, :sentience, :size, :star,
    :year

  def initialize(planet_hash)
    #----------- INITIALIZE BASE VALUES ----------
    @day                 = planet_hash[:day]
    @distance            = planet_hash[:distance]
    @exports             = planet_hash[:exports]
    @moons               = {}
    @name                = planet_hash[:name]
    @number              = planet_hash[:number]
    @sentience           = planet_hash[:sentience]
    @size                = planet_hash[:size]
    @symbol              = planet_hash[:symbol]
    @year                = planet_hash[:year]

    #----------- UPDATE INITIALIZED VALUES ----------
    update_day
    update_number
    update_sentience
  end

  #----------- SELECT DESCRIBERS ----------

  def select_describe
    puts "Hi! #{ @name } here. What would you like to know about me?"
    puts "1. I can summarize / tell you a few of my favorite things about my planetary body."
    puts "2. I can tell you about my chief exports."
    puts "3. Or I can tell you about my moons!"
    puts "4. I can also tell you how far I am from other objects in the solar system."

    user_input = get_user_input("What would you like to know?")

    summary = %w{one 1 uno summ favor planet body}
    exports = %w{two 2 tow dos cheif chief expo ports}
    moons = %w{thre 3 tres moon luna satel}
    distance = %w{four 4 cuat fuor dista far from syst form}

    if check_triggers(summary, user_input) #!W this is gebroked
      return self.describe
    elsif check_triggers(exports, user_input)
      return self.describe_exports
    elsif check_triggers(moons, user_input)
      return self.describe_moons
    elsif check_triggers(distance, user_input)
      return self.select_distance
    else
      options = [self.describe, self.describe_exports, self.describe_moons, self.select_distance]

      random_index = rand(0...options.length)

      return options[random_index]
    end
  end

  # this is a beast. I'm sure there is an easier way to do this; it just isn't
  # coming to mind right now. oh man @_@. I just realized at the least I could
  # have crammed everything into an array or hash and looped through it. !W
  def select_distance #!W generate this yo

    # display system objects available to user
    puts "1. Sol"
    sol_triggers = %w{1 one sol sun} # despite being first, this will be checked last b/c 10-17 all have 1s in them

    puts "2. Mercury"
    mer_triggers = %w{2 two merc cury}

    puts "3. Venus"
    ven_triggers = %w{3 thre venu enus}

    puts "4. Earth"
    ear_triggers = %w{4 four fuor eart terr}

    puts "5. Moon"
    moo_triggers = %{5 five moon luna} # this will also be checked after all the other moons b/c moon

    puts "6. Mars"
    mar_triggers = %w{6 six mars mras} # this will be checked after triton in case user types sixteen

    puts "7. Jupiter"
    jup_triggers = %w{7 seve jupi iter} # this will be checked after its moons in case the user says jupiter's callisto etc
                                        # and also after pluto in case the user types seventeen
    puts "8. Callisto"
    cal_triggers = %w{calli listo 8 eigh}

    puts "9. Europa"
    eur_triggers = %w{euro ropa 9 nine nien}

    puts "10. Ganymede"
    gan_triggers = %w{gany mede meed 10 ten}

    puts "11. Io"
    io_triggers = %w{io 11 elev elve}

    puts "12. Saturn"
    sat_triggers = %w{satu turn 12 twel elve} # this will be checked after its moon

    puts "13. Titan"
    tit_triggers = %w{tita itan 13 thirt thrit}

    puts "14. Uranus"
    ura_triggers = %w{uran anus 14 fourt urteen}

    puts "15. Neptune"
    nep_triggers = %w{nept tune 15 fifteen fteen} # this will be checked after its moon

    puts "16. Triton"
    tri_triggers = %w{trit iton 16 sixte xteen}

    puts "17. Pluto"
    plu_triggers = %w{plut luto dwarf 17 sevent nteen}

    # ask user which object
    user_input = get_user_input("What would you like to compare me to?")

    star = get_known_universe


    # redonkulous check.
    if check_triggers(mer_triggers, user_input)
      self.distance_from(star.planets[:mercury])

    elsif check_triggers(ven_triggers, user_input)
      self.distance_from(star.planets[:venus])

    elsif check_triggers(ear_triggers, user_input)
      self.distance_from(star.planets[:earth])

    elsif check_triggers(cal_triggers, user_input)
      self.distance_from(star.planets[:jupiter].moons[:callisto])

    elsif check_triggers(eur_triggers, user_input)
      self.distance_from(star.planets[:jupiter].moons[:europa])

    elsif check_triggers(gan_triggers, user_input)
      self.distance_from(star.planets[:jupiter].moons[:ganymede])

    elsif check_triggers(io_triggers, user_input)
      self.distance_from(star.planets[:jupiter].moons[:io])

    elsif check_triggers(tit_triggers, user_input)
      self.distance_from(star.planets[:saturn].moons[:titan])

    elsif check_triggers(sat_triggers, user_input)
      self.distance_from(star.planets[:saturn])

    elsif check_triggers(ura_triggers, user_input)
      self.distance_from(star.planets[:uranus])

    elsif check_triggers(tri_triggers, user_input)
      self.distance_from(star.planets[:neptune].moons[:triton])

    elsif check_triggers(mar_triggers, user_input)
      self.distance_from(star.planets[:mars])

    elsif check_triggers(nep_triggers, user_input)
      self.distance_from(star.planets[:neptune])

    elsif check_triggers(plu_triggers, user_input)
      self.distance_from(star.planets[:pluto])

    elsif check_triggers(jup_triggers, user_input)
      self.distance_from(star.planets[:jupiter])

    elsif check_triggers(moo_triggers, user_input)
      self.distance_from(star.planets[:earth].moons[:moon])

    elsif check_triggers(sta_triggers, get_user)
      self.distance_from(star)

    else
      puts "I'm sorry. I didn't understand what you wanted to compare me to."
      return self_describe
    end

    return
  end

  #----------- USE DESCRIBERS ----------

  def describe
    puts "\tAt about #{ format_distance }, from good ol' #{ @star }"
    puts "(on average), #{ @name } is the #{ @number } planet from the sun. It has #{ format_moons }, and its closest"
    puts "neighbors often describe it as \"#{ @sentience }.\"\n\n"

    puts "\tFor every earth standard day, #{ @name } experiences #{ @day.round(3) } days, or #{ format_hours }"
    puts "earth hours. For every year that passes on earth, #{ @name } experiences #{ (1 / @year).round(3) }. That is,"
    puts "it rotates around #{ @star } every #{ format_months } earth months. Hmmm, that's #{ format_year }."
    puts "#{ @local_year }\n\n"

    puts "#{ describe_exports } \n"

    puts "That's all I can tell you right now!\n\n"

    return
  end

  def describe_exports
    if @exports
      puts "\t#{ @name }'s primary exports are:"

      count = 1
      @exports.each do |export|
        puts "\t\t#{ count }. #{ export }"
        count += 1
      end

    else
      puts "\t#{ @name }'s exports are pretty much nonexistent at this point."
    end

    return
  end

  def describe_moons
    if @moons.length > 0
      puts "I have #{ format_moons } orbiting me:"

      count = 1
      @moons.each do |moon_symbol, moon_hash|
        puts "#{ count }. #{ moon_hash.name }"
        count += 1
      end

    else
      puts "There are no moons visibly orbiting me."
      puts "I might be lonely, or they might be too small for you to see."
    end

    return
  end

  def distance_from(something)
    if something.distance > @distance
      distance_au = (something.distance - @distance).round(3)
    elsif something.distance < @distance
      distance_au = (@distance - something.distance).round(3)
    else
      return "Are you sure those are different objects?"
    end

    distance_miles = convert_au_to_miles(distance_au)
    result = "#{ @name } is #{ distance_au } AU (or #{ distance_miles } million miles) from #{ something.name }!"
    return result
  end

  def orbits(star_name)
    if star_name.class == Star
      star_name.planets[@symbol] = self
    else
      puts "Planets can only orbit stars."
    end

    set_local_year(star_name.age)
    set_star_name(star_name.name)
  end

  private

  def convert_au_to_miles(au)
    miles = au * 93
    return miles
  end

#----------- UPDATE VALUES IMMEDIATELY
  def update_day
    if @day < 0
      @day *= -1
      @retrograde = true
    end
  end

  def update_sentience
    if @sentience < 20_000
      @sentience = "not very bright"
    elsif @sentience < 100_000
      @sentience = "developing basic intelligence"
    elsif @sentience < 20_000_000
      @sentience = "having an IQ above that of a housecat, crow, or dog"
    else
      @sentience = "the smartest thing this side of the Hyades cluster"
    end
  end

  def update_number
    if @number == 1
      @number = "#{ @number }st"
    elsif @number == 2
      @number = "#{ @number }nd"
    elsif @number == 3
      @number = "#{ @number }rd"
    else
      @number = "#{ @number }th"
    end
  end

  #----------- UPDATE VALUES WHEN ASSIGNED TO STAR
  def set_local_year(age)
    year = age / @year

    if year / 1_000_000_000 > 1 # if large number of years, convert to billions
      year /= 1_000_000_000
      year = "#{ year.round(2) } billion"
    else
      year /= 1_000_000 # otherwise, millions are okay
      year = "#{ year.round(2) } million"
    end

    @local_year = "In local years, #{ @name } has existed for about #{ year } years."
  end

  def set_star_name(name)
    @star = name
  end

  #----------- FORMAT DATA FOR DESCRIBERS
  def format_distance
    au = @distance.round(3)
    miles = au * 93

    return "#{ au } astronomical units, or #{ miles } million miles"
  end

  def format_exports
    if @exports
      output = ""
      count = 0
      last = @exports.length - 1

      if count != last # unless count == index of last item in array
        @exports.each do |export|
          if count == last
            output += "and #{ export }"
          else
            output += "#{ export }, "
          end
          count += 1
        end

      else # when count == index of last item in array
        output += @exports[count]
      end

      return output

    else
      return "pretty much nonexistent"
    end
  end

  def format_hours
    hours = @day * 24
    return hours.round(3)
  end

  def format_months
    return (@year * 12).round(3)
  end

  def format_moons
    if @moons.length == 1
      return "#{ @moons.length } moon"
    else
      return "#{ @moons.length } moons"
    end
  end

  def format_retrograde #!W
    if @retrograde
      return "RETROGRADE FLAVOR TEXT"
    else
      return "BORING NOT RETROGRADE FLAVOR TEXT"
    end
  end

  def format_year
    rando = [
      "pretty believable",
      "a little weird",
      "not too scary",
      "pretty interesting"
      ]
    return rando[rand * rando.length]
  end
end

#--------------------------- end DEFINE PLANET CLASS ---------------------------
#--------------------------- begin DEFINE STAR CLASS ---------------------------

class Star
  attr_reader :age, :day, :exports, :name, :sentience
  attr_accessor :planets

  def initialize(star_hash)
    @age       = star_hash[:age]
    @day       = star_hash[:day]
    @distance_from_star  = 0 # the center of the solar system!
    @exports   = star_hash[:exports]
    @name      = star_hash[:name]
    @planets   = {}
    @sentience = star_hash[:sentience]
    @symbol    = star_hash[:symbol]
  end

  def describe_planets
    if @planets.length > 0
      puts "There are #{ @planets.length } planets orbiting me:"

      count = 1
      @planets.each do |planet|
        puts "#{ count }. #{ planet.name }"
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

#---------------------------- end DEFINE STAR CLASS ----------------------------
#--------------- begin ALL MY DATAS LIVE HERE, LOVELY LITTLE DATAS -------------

def get_known_universe

  #------------SUN---------------
  sun_info = {
    age: 4_600_000_000, # 4.6 billion years
    day: 25.38, # earth days
    distance: 0, # center of the system
    exports: ["visible light", "sheer magnetism", "thermonuclear fusion"],
    name: "Sol",
    sentience: 27_013, # flavor text
    size: 109.3, # log? scale compared to earth, same for all objects
    symbol: :sun
  }

  sun = Star.new(sun_info)

  #-----------MERCURY-------------
  mercury_info = {
    day: 58.646,
    distance: 0.387, # 57mil km 35mil miles (.387AU)
    exports: ["hot", "cold"],
    name: "Mercury",
    number: 1,
    sentience: 4,
    size: 0.383,
    symbol: :mercury,
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
    symbol: :venus,
    year: 0.61519726
  }

  venus = Planet.new(venus_info)
  venus.orbits(sun)

  #-----------EARTH--------------
  earth_info = {
    day: 0.99726968,
    distance: 1, # 150mil km (93mil mi) (1AU)
    exports: ["garbage", "radio waves", "tiny machines that crash into stuff"],
    name: "Earth",
    number: 3,
    sentience: 3_649,
    size: 1.0,
    symbol: :earth,
    year: 1.0000174
  }

  earth = Planet.new(earth_info)
  earth.orbits(sun)

  moon_info = {
    day: 27.322,
    distance: 0.00256955436, # 384,400 km, 238,855mi
    exports: ["lunar regolith"],
    name: "Moon",
    number: 1,
    sentience: 673_158_431,
    size: 0.273,
    symbol: :moon,
    year: 0.074803559
  }

  moon = Moon.new(moon_info)
  moon.orbits(earth)
  puts moon.planet

  #------------MARS--------------
  mars_info = {
    day: 1.026,
    distance: 1.52, # 228 mil km (142 mil mi, 1.52AU)
    name: "Mars",
    number: 4,
    sentience: 6_834,
    size: 0.532,
    symbol: :mars,
    year: 1.8808476
  }

  mars = Planet.new(mars_info)
  mars.orbits(sun)

  #----------JUPITER-------------
  jupiter_info = {
    day: 0.41354,
    distance: 5.20, # 779mil km, 484mil mi, 5.20AU
    exports: [
      "amazing cloud formations",
      "terrible storms",
      "sophisticated layering systems"
      ],
    name: "Jupiter",
    number: 5,
    sentience: 7_708_434,
    size: 10.97,
    symbol: :jupiter,
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
    symbol: :io,
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
    symbol: :europa,
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
    symbol: :ganymede,
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
    symbol: :callisto,
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
    symbol: :saturn,
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
    symbol: :titan,
    year: 0.4366872
  }

  titan = Moon.new(titan_info)
  titan.orbits(saturn)

  #-----------URANUS-------------
  uranus_info = {
    day: -0.718, # retrograde!
    distance:  19.2, # 2.88bilkm, 1.79bil mi, 19.2AU
    exports: ["inappropriate jokes"],
    name: "Uranus",
    number: 7,
    sentience: 2,
    size: 1.0,
    symbol: :uranus,
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
    sentience: 2_198,
    size: 1.0,
    symbol: :neptune,
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
    symbol: :triton,
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
    symbol: :pluto,
    year: 247.9206
  }

  pluto = Planet.new(pluto_info)
  pluto.orbits(sun)

  return sun
end

#---------------- end ALL MY DATAS LIVE HERE, LOVELY LITTLE DATAS --------------
#----------------------------- begin HELP SECTOR -------------------------------

def help_user
  help_text = """
You can ask about the star, the planets (individually or en masse), or any moon
close to the size of the smallest planet. Each of these objects has attributes
of their own that you are welcome to ask about. On specific star system objects,
you can ask about things like: day, year, local year, and moons.
  """

  puts help_text

  return
end




def get_user_input(question)
  puts question
  user_input = $stdin.gets.chomp
  user_input.downcase!

  if (user_input.include? "quit") || (user_input.include? "exit")
    exit
  end

  # check if user needs help
  # help_triggers = %w{help ques ? how why where what who}
  # check_triggers(help_triggers, user_input, help_user)
  return user_input
end

#------------------------------ end HELP SECTOR --------------------------------
#------------------- begin VALIDATION / CONFIRMATION SECTOR --------------------

def verify_user_request(question)
  planet = %w{plan jupi eart merc mars ven uran nept satu plut}
  moon = %w{moon io gany trit tita listo euro}
  sun = %w{sun sol sys}

  user_input = get_user_input(question)

  if check_triggers(planet, user_input)
    select_planet
  elsif check_triggers(moon, user_input)
    select_moon
  else check_triggers(sun, user_input)
    select_star
  end

  return
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


def check_triggers(triggers, check_here)
  triggers.each do |trigger|
    if check_here.include? trigger
      return true
    else
      return false
    end
  end
end

#-------------------- end VALIDATION / CONFIRMATION SECTOR ---------------------
#---------------------- begin INTERACT WITH DATA SECTOR ------------------------

def select_planet
  universe = get_known_universe

  # these should be an attribute of their objects, eh? !W
  mercury = {
    planet: :mercury,
    triggers: %w{merc 1 first one}
  }

  venus = {
    planet: :venus,
    triggers: %w{ven 2 second two}
  }

  earth = {
    planet: :earth,
    triggers: %w{eart 3 third three}
  }

  mars = {
    planet: :mars,
    triggers: %w{mars 4 four forth}
  }

  jupiter = {
    planet: :jupiter,
    triggers: %w{jupi 5 fifth fiv}
  }

  saturn = {
    planet: :saturn,
    triggers: %w{satur 6 six}
  }

  uranus = {
    planet: :uranus,
    triggers: %w{uran 7 seven}
  }

  neptune = {
    planet: :neptune,
    triggers: %w{nept 8 eight}
  }

  pluto = {
    planet: :pluto,
    triggers: %w{plut 9 ninth nine dwarf}
  }

  planets_here = [mercury, venus, earth, mars, jupiter, saturn, uranus, neptune, pluto]

  user_input = get_user_input("What planet would you like to know more about?")
  puts "Great! You want to know more about #{ user_input }. I can give you a general description,"
  puts "or I can check how far it is from another object in the system."

  # check if user wants general description
  if verify_user_confirmation("Would you like a general description of #{ user_input }?")
    planets_here.each do |planet_here|
      if check_triggers(planet_here[:triggers], user_input)
        return universe.planets[planet_here[:planet]].describe
      end
    end

  # or comparison
  elsif verify_user_confirmation("Would you like to compare #{ user_input }'s' location to another object in the system?")
    planets_here.each do |planet_here|
      if check_triggers(planet_here[:triggers], user_input)
        return universe.planets[planet_here[:planet]].select_distance
      end
    end

  else
    puts "Oops. You didn't pick one of the two choices!"
    return select_planet
  end
end


def select_moon
  universe = get_known_universe

  moon = {
    moon: :moon,
    triggers: %w{eart luna}
  }

  io = {
    moon: :io,
    triggers: %w{io}
  }

  callisto = {
    moon: :callisto,
    triggers: %w{isto calli}
  }

  ganymede = {
    moon: :ganymede,
    triggers: %w{gany mede nym}
  }

  europa = {
    moon: :europa,
    triggers: %w{euro ropa}
  }

  triton = {
    moon: :triton,
    triggers: %w{trit iton}
  }

  titan = {
    moon: :titan,
    triggers: %w{tita itan}
  }

  moons_here = [moon, io, callisto, ganymede, europa, triton, titan]

  user_input = get_user_input("What moon would you like to know more about?")
  puts "Great! You want to know more about #{ user_input }."

  moons_here.each do |moon_here|
    if check_triggers(moon_here[:triggers], user_input)
      return universe.planets[moon_here[:moon]].describe
    end
  end
end


def select_star
  universe = get_known_universe

  sun = {
    star: :sun,
    triggers: %w{sun sol}
  }

  stars_here = [sun]

  user_input = get_user_input("What star would you like to know more about?")
  puts "Great! You want to know more about #{ user_input }."

  stars_here.each do |star_here|
    if check_triggers(star_here[:triggers], user_input)
      return universe.describe_planets
    end
  end
end


def query_universe
  # puts "Note: if you are playing in irb/pry/etc & want to play with my stored"
  # puts "solar system, you'll need to assign the result of load_known_universe"
  # puts "to a variable. You will receive my Star class object affectionately"
  # puts "known as the sun. It has one star, nine planets, and seven moons."
  # puts "Enjoy! (Ctrl+C.)"

  verify_user_request("What would you like to know about the solar system?")

  if verify_user_confirmation("Would you like to know something else?")
    return query_universe
  else
    puts "Okay. It was nice chatting with your about the solar system. Goodbye!"
    return
  end
end

#----------------------- end INTERACT WITH DATA SECTOR -------------------------
#---------------------- FINALLY, CALL QUERY_SOLAR_SYSTEM! ----------------------

query_universe
