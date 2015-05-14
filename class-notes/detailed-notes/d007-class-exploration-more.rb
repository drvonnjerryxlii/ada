# define class
class Player
  def initialize(player_hash)
    @address         = player_hash[:address]
    @name            = player_hash[:name]
    @city            = player_hash[:city]
    @favorite_number = player_hash[:favorite_number]
  end

  def lives
    return "#{@address} #{@name} is alive and well in #{@city}!"
  end
end

# define players
player1 = {
  name: "Jarg",
  address: "Dr.",
  city: "Washington, DC",
  favorite_number: 5
}

player2 = {
  name: "Potato Head",
  address: "Mr.",
  favorite_number: 36
}

$count = 0
$players = []

# player constructor
def make_new_player(player, city="Seattle")
  if !player[:city] # unless player has city, do this.
    player[:city] = city
  end


  $players.push(Player.new(player))

  puts $players[$count].lives

  $count += 1

  return
end

make_new_player(player1)
make_new_player(player2)
