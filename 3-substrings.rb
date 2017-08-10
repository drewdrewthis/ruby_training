def substrings(str, dict)
  result = {}
  str.downcase!

  dict.each do |word|
    matches = str.scan(word).size
    if matches > 0
      result[word] = matches
    end
  end

  result
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

puts substrings('below', dictionary)
puts substrings("Howdy partner, sit down! How's it going?", dictionary)
