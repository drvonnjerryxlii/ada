class Player
  def play_turn(warrior)
    # cool code goes here
    @health = @health ? @health : warrior.health
    @rescue = @rescue ? @rescue : 0
    @turned_around = @turned_around ? @turned_around : false
    lookee_see = warrior.look
    lookee_see_back = warrior.look(:backward)

    if can_has_enemy?(lookee_see_back)
      if !@turned_around
        @turned_around = true
        warrior.pivot!
      elsif !warrior.feel.stairs?
        warrior.walk!
      end
    elsif warrior.feel.wall? || (warrior.feel.stairs? && !can_has_stairs?)
      warrior.pivot!
    elsif can_has_enemy?(lookee_see)
      attack_enemy(warrior)
      unless warrior.feel.empty?
        warrior.attack!
      else
        warrior.shoot!
      end
    # elsif can_has_captive? && warrior.feel.empty? #(:backward).empty?
    #   warrior.walk! #(:backward)
    elsif can_has_captive? && warrior.feel.captive?
      warrior.rescue! #(:backward)
      @rescue += 1
    elsif warrior.feel.empty?
      if @health == 20 || (warrior.health < @health && warrior.health >= 12)
        warrior.walk!
      elsif warrior.health < @health
        warrior.walk!# (:backward)
      else
        warrior.rest!
      end
    else
      warrior.attack!
    end

    @health = warrior.health
  end


  def can_has_stairs?
    if can_has_captive? # ie, are there still captives?
      return false # don't take the stairs if you still have people to save.
    else
      return true # take them if you don't.
    end
  end


  def can_has_enemy?(spaces)
    spaces.each do |space|
      if space.captive? # don't shoot if there's a captive!
        return false
      elsif space.enemy? # do shoot if there's an enemy.
        return true
      end
    end

    return false
  end


  def can_has_captive?
    no_captives = 2 # change this as appropriate for level

    if @rescue < no_captives # if you haven't yet rescued the captives
      return true
    else
      return false
    end
  end
end # class
