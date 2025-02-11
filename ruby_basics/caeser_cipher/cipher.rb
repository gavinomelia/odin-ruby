def cipher(text, shift_by)
  lowercase_letters = ('a'..'z').to_a
  uppercase_letters = ('A'..'Z').to_a
  shifted_lowercase = lowercase_letters.rotate(shift_by)
  shifted_uppercase = uppercase_letters.rotate(shift_by)
  cipher_map = Hash[lowercase_letters.zip(shifted_lowercase)].merge(Hash[uppercase_letters.zip(shifted_uppercase)])
  text.chars.map { |char| cipher_map.fetch(char, char) }.join
end