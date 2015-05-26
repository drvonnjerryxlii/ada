class Song
  def initialize(lyrics)
    @lyrics = lyrics
  end

  def sing_me_a_song()
    @lyrics.each { |line| %x{say -v "Good" #{ line }} }
  end

  def read_me_a_song()
    @lyrics.each { |line| puts line }
  end
end

happy_bday = [
  "happy birthday to you",
  "I don't want to get sued'",
  "so I'll stop right there'"
]

happy_bday = Song.new(happy_bday)

bulls_on_parade = [
  "they rally around the family",
  "with pockets full of shells"
]

bulls_on_parade = Song.new(bulls_on_parade)

happy_bday.sing_me_a_song
bulls_on_parade.sing_me_a_song
