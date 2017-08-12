require 'caesar_cipher'

describe CaesarCipher do
  it ' encrypts a string' do
    result = CaesarCipher.new(5)
      .encrypt("What a string!")

    expect(result).to eq("Bmfy f xywnsl!")
  end
end
