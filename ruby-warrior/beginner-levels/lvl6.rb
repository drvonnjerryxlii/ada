class Player
  def play_turn(warrior)
    # cool code goes here
    @health = @health ? @health : warrior.health
    @rescue = @rescue ? @rescue : 0

    if can_has_captive? && warrior.feel(:backward).empty?
      warrior.walk!(:backward)
    elsif can_has_captive?
      warrior.rescue!(:backward)
      @rescue += 1
    # elsif warrior.feel.captive?
    #   warrior.rescue!
    elsif warrior.feel.empty?
      if @health == 20 || (warrior.health < @health && warrior.health >= 12)
        warrior.walk!
      elsif warrior.health < @health
        warrior.walk!(:backward)
      else
        warrior.rest!
      end
    # elsif warrior.feel.empty? && warrior.health == @health
    #   warrior.rest!
    else
      warrior.attack!
    end

    @health = warrior.health
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
  
