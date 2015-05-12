# this one is another group project! three adies to a group. :)


class OrangeTree

  attr_reader :age, :alive, :height, :orange_count

  def initialize
    @age = 0
    @alive = true
    @height = 0
    @orange_count = 0
  end

  def grow_oranges
    if @age >= 3
      @orange_count = @age * 2
    end
  end

  def grow_taller
    if @age < 5
      @height += 2
    else
      @height += 0.1
    end
  end

  def grow_older
    @age += 1
  end

  def one_year_passes
    if @alive == true
      if @age < 10
        grow_older
        grow_taller
        grow_oranges

      else
        puts "This tree has lived ten long years and has now died."
        @orange_count = 0
        @age = "dead"
        @height = 0
        @alive = false
      end

    else
      puts "This tree is dead."
    end
  end

  def pick_orange
    if @orange_count != 0
      @orange_count -= 1
      puts "That was a very tasty orange!"
    else
      puts "There are no more oranges to pick this year."
    end
  end

  def plant_on(grove)
    grove.trees.push(self)
  end

end


class OrangeGrove
  attr_reader :total_orange_count, :trees

  def initialize
    @trees = []
    @total_orange_count
    @soil_quality = "healthy"
  end

  def soil_quality
    if @trees.length <= 5
      @soil_quality = "healthy"
    elsif @trees.length <= 10
      @soil_quality = "average"
    else
      @soil_quality = "unhealthy"
    end
  end

  def plant_trees(number)
    if number.to_i != 0
      number.times do
        @trees.push(OrangeTree.new)
      end

    else
      puts "You can't plant #{number} trees. Please try again with a number."
    end

  end

  def one_year_passes_grove
    @total_orange_count = 0
    @trees.each do |tree|
      tree.one_year_passes
      @total_orange_count += tree.orange_count
    end
  end

end


#
# -----------------------------
# GROVE
# @soil_quality - 0-5 healthy (10yrs) 3 oranges <-- definitely
#                 6-10 average (8yrs) 2 oranges
#                 11+ unhealthy (5yrs) 1 oranges
# @tree_count
# @check_soil_quality
#    - how many trees
#
# TREE
# @in_grove init no
# @grove grove name
#
# as tree_count up, soil_quality down
# as soil_quality down, orange_production down
#
# grove plant trees
#         - update in_grove
#         - update soil_quality
# grove one year passes
#         - check planting
#         - check
#         - delete dead trees first, then plant new ones
# tree plant on will update in_grove
#
