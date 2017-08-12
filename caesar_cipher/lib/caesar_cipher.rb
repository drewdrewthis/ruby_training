class CaesarCipher
  @@alphabet_length = 'z'.ord - 'a'.ord + 1

  def initialize(num)
    @num = num
  end

  def encrypt(str)
    str
      .split('')
      .map do |l|
        progressed_letter(l)
      end
      .join('')
  end

  def progressed_letter(l)
    if l.match(/[a-z]/)
      new_letter(l)
    elsif l.match(/[A-Z]/)
      new_letter(l.downcase).upcase
    else
      l
    end
  end

  def new_letter(l)
    pos = l.ord - 'a'.ord
    new_pos = (pos + @num) % @@alphabet_length
    new_ord = 'a'.ord + new_pos
    new_ord.chr
  end
end
