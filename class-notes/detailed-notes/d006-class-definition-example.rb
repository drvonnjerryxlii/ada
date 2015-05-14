class Chair
#------------------------ FIRST, VERY CONCRETE DEFINITON ----------------------

  # does not have setter methods!
  # def style
  #   "Vilgot"
  # end
  #
  # def weight_in_lbs
  #   29
  # end
  #
  # def type
  #   "Swivel"
  # end
  #
  # def color
  #   "Black"
  # end
  #
  # def max_height_inches
  #   23.625
  # end

#------------- SECOND, ADDING SOME INTIALIZING & SETTER DEFINITIONS ------------

  # def initialize(name, color) # yeah, some initial setter methods!
  #   @name = name # this is an instance variable
  #   @color = color # it exists as long as the instance of the chair class exists
  # end
  #
  # def name # GETTER METHOD
  #   @name # ACCESSOR METHOD
  # end
  #
  # def name=(new_name) # SETTER METHOD FOR name YEESSSSSSSSSSS <3
  #   @name = new_name # REASSIGNMENT METHOD
  # end
  #
  # def color
  #   @color
  # end
  #
  # def color=(new_color) # setter method for color
  #   @color = new_color
  # end

#-------------- THIRD, SIMPLYING IT BY USING ATTRIBUTE ACCESSORS ---------------
  # attr_reader :name, :color # these can be further simplified!
  # attr_writer :name, :color # you can use attr_accessor instead to do both. :)
  attr_accessor :name, :color

  def initialize(name, color)
    @name = name
    @color = color
    # puts self
  end

end


roller_chair = Chair.new("roller chair", "Black")

puts roller_chair.color # Black
puts roller_chair.name # roller chair
puts roller_chair.class # Chair
puts [].class # Array

roller_chair.name = "best roller chair ever!"
roller_chair.color = "Black as my soul!" # my soul prefers the dark side
                                         # well, my eyes do. maybe soul != eyes.

puts roller_chair.name # best roller chair ever!
puts roller_chair.color # Black as my soul!
# puts self

spinny_chair = Chair.new("spinny chair", "splendiferous sparkly rainbow monstrosity")
puts spinny_chair.name # spinny chair
puts spinny_chair.color # splendiferous sparkly rainbow monstrosity
