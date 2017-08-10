class TicTacToe
  def initialize
    puts "Player 1, what's your name?"
    @p1 = Player.new(gets.chomp)

    puts "Player 2, what's your name?"
    @p2 = Player.new(gets.chomp)

    puts "Cool. Let's begin"
    puts ""

    @board = Board.new
    @current_player = @p1
    play
  end

  private

  def turn
    puts "#{@current_player.name} Where will you move?"
    @board.show
    coords = gets.chomp.split('')
    success = @board.mark(@current_player.mark, coords[0], coords[1])
    return re_do unless success
    change_turns
  end

  def change_turns
    @current_player = @current_player == @p1 ? @p2 : @p1
  end

  def play
    begin
      turn
    end until game_over?

    puts "Game over! #{@current_player}"
  end

  def game_over?
    false
    # if @board sum = winning amount
  end

  def re_do
    puts "Invalid move. Try again"
    turn
  end
end

class Player
  attr_reader :name, :mark
  @@marks = ['X', 'O']

  def initialize(name)
    puts "It's only a two player game!" if @@marks.empty?
    @mark = @@marks.shift
    @name = name
    puts "Hi, #{name}. You'll be #{@mark}"
  end
end

class Board
  def initialize
    @board = Array.new(3) { [[],[],[]] }
  end

  def show
    @board.each { |row| puts row.to_s }
  end

  def mark(symbol, x_coord, y_coord)
    c = y_coord.to_i

    r = case x_coord
        when 'A' then 0
        when 'B' then 1
        when 'C' then 2
        else -1
    end

    return false if !c.between?(-1,3) || r < 0

    @board[r][c] = symbol

    true
  end
end

TicTacToe.new
