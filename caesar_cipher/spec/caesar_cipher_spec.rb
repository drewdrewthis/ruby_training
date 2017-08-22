require 'caesar_cipher'

describe CaesarCipher do
  it ' encrypts a string' do
    result = CaesarCipher.new(5)
      .encrypt("What a string!")

    expect(result).to eq("Bmfy f xywnsl!")
  end

  it ' decrypts a string' do
    result = CaesarCipher.new(5)
      .decrypt("Bmfy f xywnsl!")

    expect(result).to eq("What a string!")
  end
end
