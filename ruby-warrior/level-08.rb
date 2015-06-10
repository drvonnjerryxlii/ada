class Player
  def play_turn(warrior)
    # cool code goes here
    @health = @health ? @health : warrior.health
    @rescue = @rescue ? @rescue : 0

    lookee_see = warrior.look

    if warrior.feel.wall?
      warrior.pivot!
    elsif can_has_enemy?(lookee_see)
      warrior.shoot!
    elsif can_has_captive? && warrior.feel.empty? #(:backward).empty?
      warrior.walk! #(:backward)
    elsif can_has_captive?
      warrior.rescue! #(:backward)
      @rescue += 1
    # elsif warrior.feel.captive?
    #   warrior.rescue!
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

  def can_has_enemy?(spaces)
    spaces.each do |space|
      if space.captive?
        return false
      elsif space.enemy?
        return true
      end
    end

    return false
  end

  def can_has_captive?
    no_captives = 1

    if @rescue < no_captives
      return true
    else
      return false
    end
  end
end
