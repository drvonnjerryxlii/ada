# pair project w/ Wang

# our notes:

# SET UP
# display empty board
# = select random word
# = display right number of letter spaces for that word
# = display actual board
#
# TURN
# = prompt user guess one letter please
# = check if letter in word
#    - if right, update display of letters in word
#    - if wrong, update display of hangman
#             &  increase wrong guess counter
#
# CHECK WIN/LOSE
# - if displayed letters == actual word:
#       WIN WIN WIN
# - elsif wrong guess counter == limit
#       LOSE LOSE LOSE
# - else
#       go back to turn / restart turn loop / don't break loop


class Hangman
# our dead hangman. poor dead hangman!
"""
      ______
     |      |
    {0}     |
   (\~/)    |
    (:)     |
   _/ \_    |
     _______|___
    |           |
"""

# 1. {0}
# 2. (\
# 3. /)
# 4. ~
# 5. (:)
# 6. _/
# 7. \_

  def initialize
    # hangman board:
    @first        = "     ______       "
    @second       = "    |      |      "
    @third        = "           |      "
    @fourth       = "           |      "
    @fifth        = "           |      "
    @sixth        = "           |      "
    @seventh      = "    _______|___   "
    @eighth       = "   |           |  "
    @ninth        = "                  "
    @tenth        = "  H A N G M A N   " # change based on how many letters, etc

    # start game
    start
  end


  def display_board
    @hangman = [@first, @second, @third, @fourth, @fifth,
                @sixth, @seventh, @eighth, @ninth, @tenth]


    @hangman.each do |line|
      puts line
    end

    puts "\n"
  end


  def set_answer
    possible_answers = [ "potato", "broccoli", "animal", "hotdog",
      "elephant", "cat", "taco", "whale", "walrus", "vulture" ]

    # select random word
    which_random_index = rand(0...possible_answers.length)
    @answer = possible_answers[which_random_index]

    # update hangman word display
    @tenth = " _" * @answer.length

    puts @answer # for tests
  end




  def start
    puts "Let's play hangman!"

    @now_playing = true
    @answer_display = []
    @bad_count = 0
    @good_count = 0

    set_answer
    display_board
    play
  end

  def play
    while @now_playing
      guess = get_guess
      check_guess(guess)

      display_board
    end
  end

  def get_guess
    puts "Guess your letter:"

    input = gets.chomp.downcase

    if input == "quit"
      exit
    end

    return input
  end

  def check_guess(guess)
    unless @answer.include? guess # if answer not include guess, do this
      @bad_count += 1
      bad_guess

    else # if answer include guess, do this
      number_of_indexes = @answer.length

      index = 0
      number_of_indexes.times do
        puts @answer[index] # tests

        if @answer[index] == guess
          @good_count += 1
          # put index / letter into display
          # according to our display, index to update is (index * 2) +1
          index_to_update = (index * 2) + 1
          # @answer_display.push(index_to_update)
          # @answer_display.sort!

          good_guess(index, index_to_update)
        end

        index += 1
      end
    end
  end


  def bad_guess
    if @bad_count == 1
      @third =   "   {0}     |      "
    elsif @bad_count == 2
      @fourth =  "  (\\       |      "
    elsif @bad_count == 3
      @fourth =  "  (\\ /)    |      "
    elsif @bad_count == 4
      @fourth =  "  (\\~/)    |      "
    elsif @bad_count == 5
      @fifth =   "   (:)     |      "
    elsif @bad_count == 6
      @sixth =   "  _/       |      "
    else # @count == 7
      @sixth = "  _/ \\_    |      "
      lose
    end
  end


  def good_guess(answer_letter, display_letter)
    @tenth[display_letter] = @answer[answer_letter]

    if @good_count == @answer.length
      win
    end
  end


  def win
    puts "You win!"
    @now_playing = false

  end

  def lose
    puts "You lose!"
    @now_playing = false

  end










end

Hangman.new
