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
#
# @soil_quality
# @tree_count
#
# as tree_count up, soil_quality down
# as soil_quality down, orange_production down
