def substrings(sentence, dictionary)
  words_array = sentence.downcase.split

  matches = words_array.flat_map do |word|
    dictionary.select { |dict| word.include?(dict) }
  end

  matches.tally
end