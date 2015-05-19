class Animal
  attr_accessor :distance

  def initialize
    @distance = 0
  end

  def walk
    @distance += 1
  end
end


class Dog < Animal
  attr_reader :name

  def initialize(name)
    super()
    @name = name
  end

  def speak
    puts "Woof woof!"
  end
end


class Cat < Animal
  def initialize(name)
    super()
    @name = name
  end

  def speak
    puts "Niao niao!"
  end
end


class Person
  attr_accessor :pet

  def initialize(name)
    @name = name
    @pet = nil
  end

  def speak
    puts "Hi! My name is #{ @name }. How are you?"
  end
end


class Employee < Person
  def initialize(name, salary)
    super(name)
    @salary = salary
  end

  def speak
    puts "Hi! My name is #{ @name }. May I interest you in a coffee?"
  end
end


class Fish
  attr_reader :distance

  def initialize
    @distance = 0
    @location = "the sea"
  end

  def swim
    puts "Your fish swims around #{ @location }."
    @distance += 1
  end
end


class Salmon < Fish
  def initialize
    super()
    @distance = 10
  end

  def swim
    puts "Your salmon swims around #{ @location }."
    @distance += 0.5
  end
end


class Halibut < Fish
  def initialize
    super()
    @shine = 0
  end

  def swim
    super()
    @shine += rand(0..5)
  end

  def magical?
    if @shine > 10
      true
    else
      false
    end
  end

  def cast_spell(spell, spell_effects)
    puts "Your halibut casts #{ spell }, and #{ spell_effects }!"
    @shine -= 10
  end
end


satan = Cat.new("Satan")
satan.speak

mary = Person.new("Mary")
mary.pet = satan
mary.speak

rover = Dog.new("Rover")
rover.speak

frank = Employee.new("Frank", 120_000)
frank.pet = rover
frank.speak

flipper = Fish.new()
crouse = Salmon.new()
harry = Halibut.new()

10.times do
  flipper.swim
  crouse.swim
  harry.swim

  while harry.magical?
    harry.cast_spell("lightning", "fries its dinner up nicely")
  end
end
