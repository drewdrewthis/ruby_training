class CodeMaster
  def initialize(code)
    @possible_colors = %w{ red green blue orange }
    @code = code ? code : set_code(code)
  end

  def give_hints(guess)
    hints(guess)
  end

  private

  def set_code
    code = []
    4.times do
      rand = Random.new.rand(0...possible_colors.length)
      code << possible_colors[rand]
    end
    code
  end

  def hints(guess)
    hint = []
    code_copy = @code

    # Check if spot on
    guess.each_with_index do |color, i|
      if color == code_copy[i]
        hint << :colored_peg
        code_copy[i] = nil
      end
    end

    # Check if just includes
    guess.each_with_index do |color, i|
      if code_copy.include? color
        hint << :white_peg
        code_copy[i] = nil
      end
    end

    hint
  end
  
end
