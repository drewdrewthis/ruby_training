loop do
  puts 'String'
  @str = gets.chomp

  puts 'Number'
  @num = gets.chomp.to_i

  def caesar_cipher
    @str
      .split('')
      .map do |l|
        (l.ord + @num).chr
      end
      .join('')
  end

  puts caesar_cipher
  break if @str.downcase == 'end'
end
