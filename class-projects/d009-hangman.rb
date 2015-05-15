# -*- coding: utf-8 -*-
require "colorize"

# pair project w/ Wang

class Hangman
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
    @bad_count = 0
    @good_count = 0
    @letters_guessed = []

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

    input = gets.chomp.downcase # downcase == shouldn't matter if cap letters

    if input == "quit"
      exit
    end

    until (input >= "a") && (input <= "z") && (input.length == 1) # while these aren't true / until they are
      puts "Please enter a valid letter."
      input = gets.chomp.downcase
    end

    @letters_guessed.push(input)

    puts "You've guessed: " + @letters_guessed.join(" ") # You've guessed: a b c

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
      @third =   "   {0}".colorize(:blue) + "     |      "
    elsif @bad_count == 2
      @fourth =  "  (\\".colorize(:cyan) + "       |      "
    elsif @bad_count == 3
      @fourth =  "  (\\".colorize(:cyan) + " /)".colorize(:magenta) + "    |      "
    elsif @bad_count == 4
      @fourth =  "  (\\".colorize(:cyan) + "~".colorize(:yellow) + "/)".colorize(:magenta) + "    |      "
    elsif @bad_count == 5
      @fifth =   "   (:)".colorize(:red) + "     |      "
    elsif @bad_count == 6
      @sixth =   "  _/".colorize(:green) + "       |      "
    else # @count == 7
      @sixth = "  _/".colorize(:green) + " \\_".colorize(:light_green) + "    |      "
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
