# overwrites methods, so if sub class has its own initialize, master class will not call initialize!
# super() will execute the base method and then keep going as though it were all one method! :)

#---------------BASE CLASS-----------------

class Fish
  attr_accessor :distance, :fins, :gills, :scales

  def initialize #????
    @distance = 0
    @fins = 3
    @gills = 6
    @scales = 200
  end

  def is_a_fish?
    true
  end

  def swim
    @distance += 1
  end
end


#------------------SUB CLASSES--------------------

class Salmon < Fish


end

class Halibut < Fish
  def initialize(name)
    super()
    @name = name
    @scales = 2_000
  end

  def swim
    @distance += 2
  end
end

class ClownFish < Fish

  def initialize(name)
    super()
    @name = name
    @scales = 1_000
  end

end

class Trout < Fish
  # Trout is-a Fish
  def swim
    @distance += 4
  end
end

nemo = ClownFish.new("Nemo") # nemo is-a Fish, is-a ClownFish
nemo.is_a_fish? # true
nemo.scales = 1_000_000


tom = Halibut.new("Tom")
