# SOLAR SYSTEM
# zomg i am so excited about this <3
# reusing these numbers:
# => https://github.com/drvonnjerryxlii/drvonnjerryxlii.github.io/tree/master/solarSystem

# SUN https://solarsystem.nasa.gov/planets/profile.cfm?Object=Sun&Display=Facts
# AGE http://www.universetoday.com/33740/how-old-is-mercury/ all 4.6bil
# PLUTO http://www.space.com/43-pluto-the-ninth-planet-that-was-a-dwarf.html
# !W planet cannot orbit planet

#------------------------------ DEFINE MOON CLASS ------------------------------
class Moon
  attr_reader :age, :avg_distance_from_planet, :day, :name, :number, :planet,
    :size, :year

  def initialize(moon_hash)
    @age                      = moon_hash[:age]
    @avg_distance_from_planet = moon_hash[:avg_distance_from_planet]
    @day                      = moon_hash[:day]
    @name                     = moon_hash[:name]
    @number                   = moon_hash[:number]
    @size                     = moon_hash[:size]
    @year                     = moon_hash[:year]
  end

  def orbits(planet_name)
    if planet_name.class == Planet
      planet_name.moons.push(self)
      @planet = planet_name
    else
      puts "Moons can only orbit planets."
    end
  end

end

#----------------------------- DEFINE PLANET CLASS -----------------------------

class Planet
  attr_accessor :moons
  attr_reader :age, :avg_distance_from_sun, :day, :name,
    :rotates_clockwize, :size, :star, :temperature_max,
    :temperature_min, :year

  def initialize(planet_hash)
    @age                   = planet_hash[:age]
    @day                   = planet_hash[:day]
    @moons                 = []
    @name                  = planet_hash[:name]
    @size                  = planet_hash[:size]
    @year                  = planet_hash[:year]
  end

  def orbits(star_name)
    if star_name.class == SolarSystem
      star_name.planets.push(self)
      @star = star_name
    else
      puts "Planets can only orbit stars."
    end
  end

  def describe_moons
    if @moons.length > 0
      puts "There are #{@moons.length} planets orbiting me:"

      count = 1
      @moons.each do |moon|
        puts "#{count}. #{moon.name}"
        count += 1
      end

    else
      puts "There are no moons visibly orbiting me."
      puts "I might be lonely, or they might be too small for you to see."
    end
  end

  def local_year
    year = star.age / @year
    puts "The current year on #{@name} is #{year} years!"
  end

end

#------------------------------ DEFINE STAR CLASS ------------------------------

class SolarSystem
  attr_reader :age, :name
  attr_accessor :planets

  def initialize(star_hash)
    @age            = star_hash[:age]
    @name           = star_hash[:name]
    @planets        = []
    return
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

def the_known_universe

  #------------SUN---------------
  sun_info = {
    age: 4_600_000_000, # 4.6 billion years
    day: 25.38, # earth days
    name: "Sol",
    size: 109.3 # log? scale compared to earth, same for all objects
  }

  sun = SolarSystem.new(sun_info)

  #----------MERCUERY-------------
  mercury_info = {
    age: 4_600_000_000, # 4.6 billion years
    day: 58.646, # earth days
    name: "Mercury",
    size: 0.383,
    year: 0.2408467 # earth years (87.97 earth days)
  }

  mercury = Planet.new(mercury_info)
  mercury.orbits(sun)

  #-----------VENUS--------------
  venus_info = {
    age: 4_600_000_000, # 4.6 billion years
    day: -243.018, # retrograde
    name: "Venus",
    size: 0.95,
    year: 0.61519726
  }

  venus = Planet.new(venus_info)
  venus.orbits(sun)

  #-----------EARTH--------------
  earth_info = {
    age: 4_600_000_000, # 4.6 billion years
    avg_distance_from_sun: 149_600_000, # 149.5mil km (92.96mil mi) (1AU)
    day: 0.99726968,
    name: "Earth",
    size: 1.0,
    year: 1.0000174
  }

  earth = Planet.new(earth_info)
  earth.orbits(sun)

  moon_info = {
    day: 27.322,
    name: "Moon",
    number: 1,
    size: 0.273,
    year: 0.074803559
  }

  moon = Moon.new(moon_info)
  moon.orbits(earth)

  #------------MARS--------------
  mars_info = {
    age: 4_600_000_000, # 4.6 billion years
    day: 1.026,
    name: "Mars",
    size: 0.532,
    year: 1.8808476
  }

  mars = Planet.new(mars_info)
  mars.orbits(sun)

  #----------JUPITER-------------
  jupiter_info = {
    age: 4_600_000_000, # 4.6 billion years
    day: 0.41354, # earth days
    name: "Jupiter",
    size: 10.97,
    year: 11.862615 # earth years
  }

  jupiter = Planet.new(jupiter_info)
  jupiter.orbits(sun)

  io_info = {
    day: 1.769,
    name: "Io",
    number: 1,
    year: 0.004843258
  }

  io = Moon.new(io_info)
  io.orbits(jupiter)

  europa_info = {
    day: 3.551181041,
    name: "Europa",
    number: 2,
    year: 0.009722108
  }

  europa = Moon.new(europa_info)
  europa.orbits(jupiter)

  ganymede_info = {
    day: 7.15455296,
    name: "Ganymede",
    number: 3,
    year: 0.019589322
  }

  ganymede = Moon.new(ganymede_info)
  ganymede.orbits(jupiter)

  callisto_info = {
    day: 16.6890184,
    name: "Callisto",
    number: 4,
    year: 0.04569473
  }

  callisto = Moon.new(callisto_info)
  callisto.orbits(jupiter)

  #-----------SATURN-------------
  saturn_info = {
    age: 4_600_000_000, # 4.6 billion years
    day: 0.444, # earth days
    name: "Saturn",
    size: 9.14,
    year: 29.447498 # earth years
  }

  saturn = Planet.new(saturn_info)
  saturn.orbits(sun)

  titan_info = {
    day: 15.95, # earth days, same as year
    name: "Titan",
    number: 6,
    year: 0.4366872 # earth years, same as day
  }

  titan = Moon.new(titan_info)
  titan.orbits(saturn)

  #-----------URANUS-------------
  uranus_info = {
    age: 4_600_000_000, # 4.6 billion years
    day: -0.718, # earth days, retrograde
    name: "Uranus",
    size: 1.0,
    year: 84.016846 # earth years
  }

  uranus = Planet.new(uranus_info)
  uranus.orbits(sun)

  #-----------NEPTUNE------------
  neptune_info = {
    age: 4_600_000_000, # 4.6 billion years
    day: 0.671, # earth days
    name: "Neptune",
    size: 1.0,
    year: 164.79132 # earth years
  }

  neptune = Planet.new(neptune_info)
  neptune.orbits(sun)

  triton_info = {
    day: 5.877, # earth days, same as year
    name: "Triton",
    number: 1,
    year: 0.016090349 # earth years, same as day
  }

  triton = Moon.new(triton_info)
  triton.orbits(neptune)

  #------------PLUTO-------------
  pluto_info = {
    age: 4_600_000_000, # 4.6 billion years
    avg_distance_from_sun: 5_906_380_000, # 5,906,380,000 km (3,670,050,000 miles)
    day: -6.387, # earth days, retrograde
    name: "Pluto",
    size: 0.185,
    year: 247.9206 # earth years
  }

  pluto = Planet.new(pluto_info)
  pluto.orbits(sun)

  return sun
end




def query_solar_system
  solar_system =
  puts "What would you like to "
end
