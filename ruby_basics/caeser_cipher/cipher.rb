def cipher(text, shift_by)
  letters = ('a'..'z').to_a 
  shifted = letters.rotate(shift_by)
  cipher_map = Hash[letters.zip(shifted)]
  text.chars.map { |char| cipher_map[char] }.join
end