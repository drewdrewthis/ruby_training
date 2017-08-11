require 'CodeMaster'
require 'Board'

class Mastermind
  def initialize
    @guess_count = 0
    start
  end

  def start
    puts "Welcome to Mastermind!"
    @code_master = CodeMaster.new
    puts "The computer is CodeMaster. It has chosen a code"
    play
  end

  def play
    until game_over(guess) do
      puts "What's your guess? or type 'Show Board'"
      guess = gets.chomp.split
      if guess[0] == 'Show'
        @board.show
      else
        proceed(guess)
      end
    end

    game_over_message(guess)
  end

  def proceed(guess)
      hint = @code_master.check_guess(guess)
      @board.add_guess_row(guess, hint)
      @guess_count += 1
  end

  def game_over(guess)
    guess == CodeMaster.code || @guess_count > 12
  end

  def game_over_message(guess)
    if guess == CodeMaster.code
      puts "You've deciphered the code! It was #{CodeMaster.code}"
    else
      puts "Oh no! Out of turns!"
    end
  end

  def increment_guess_count
    @guess_count += 1
    game_over if @guess_count > 12
  end
end
