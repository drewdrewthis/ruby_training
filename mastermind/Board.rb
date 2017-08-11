class Board
  def initialize(code)
    @code = code
    @rows = []
  end

  def add_row(a, b, c, d, hint)
    puts 'No more moves!' if board_full?
    guess = [a, b, c, d]
    hint = @code_master.give_hints(guess)
    @rows << {
      guess: guess,
      hints: hint
    }
    hint
  end

  def show
    @rows.each { |r| puts r.to_s }
  end
end
