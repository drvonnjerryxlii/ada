class Player
  def play_turn(warrior)
    # cool code goes here
    @health = @health ? @health : warrior.health

    if warrior.feel.empty? && (@health == 20 || warrior.health < @health)
      warrior.walk!
    elsif warrior.feel.empty? && warrior.health == @health
      warrior.rest!
    else
      warrior.attack!
    end

    @health = warrior.health
  end
