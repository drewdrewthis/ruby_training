class CaesarCipher
  @@alphabet_length = 'z'.ord - 'a'.ord + 1

  def initialize(num)
    @num = num
  end

  def encrypt(str)
    str
      .split('')
      .map do |l|
        progressed_letter(l, false)
      end
      .join('')
  end

  def decrypt(str)
    str
      .split('')
      .map do |l|
        progressed_letter(l, true)
      end
      .join('')
  end

  private

  def progressed_letter(l, encrypted)

    if l.match(/[a-z]/)
      new_letter(l, encrypted)
    elsif l.match(/[A-Z]/)
      new_letter(l.downcase, encrypted).upcase
    else
      l
    end
  end

  def new_letter(l, encrypted)
    pos = l.ord - 'a'.ord
    new_pos = (encrypted ? pos - @num : pos + @num) % @@alphabet_length
    new_ord = 'a'.ord + new_pos
    new_ord.chr
  end
end
